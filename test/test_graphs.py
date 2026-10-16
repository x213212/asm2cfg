"""Semantic regression cases for the fork's RISC-V, calls, SCC and dominance features."""

import json
import random
import subprocess
import sys
from pathlib import Path

import networkx as nx
import pytest

from src.asm2cfg.analysis import analyze_function, immediate_dominators, strongly_connected_components
from src.asm2cfg.cfg import adjacency, call_sites
from src.asm2cfg.command_line import main
from src.asm2cfg.model import Address
from src.asm2cfg.parser import ParseError, parse_program
from src.asm2cfg.render import call_graph, cfg_graph, write_graph
from src.asm2cfg.targets import target_from_gdb_arch


RISCV = '''
00000000 <main>:
   0: 000000ef jal ra,20 <worker>
   4: 00050463 beq a0,zero,c <main+0xc>
   8: bffd c.j 4 <main+0x4>
   c: 8082 ret
00000020 <worker>:
  20: 9782 c.jalr a5
  22: 8082 ret
'''


def test_calls_and_cfg_do_not_share_edges():
    program = parse_program(RISCV.splitlines(), 'riscv')
    assert list(program.functions) == ['main', 'worker']
    function = program.functions['main']
    assert function.blocks[0].jump_edge is None
    assert function.blocks[0].no_jump_edge == 4
    assert 0x20 not in adjacency(function.blocks)[0]
    sites = call_sites(program)
    assert (sites[0].caller, sites[0].callee, sites[0].external) == ('main', 'worker', False)
    assert sites[1].kind == 'indirect-call'
    analysis = analyze_function(function)
    assert {frozenset(cycle) for cycle in analysis.cycles} == {frozenset((4, 8))}
    assert analysis.back_edges == {(8, 4)}
    assert analysis.immediate_dominators == {0: 0, 4: 0, 8: 4, 12: 4}


@pytest.mark.parametrize('instruction,call,jump,sink', [
    ('jal ra,20', True, False, False), ('jal x1,20', True, False, False),
    ('jal x5,20', True, False, False), ('jal 20', True, False, False),
    ('jal zero,20', False, True, False), ('j 20', False, True, False),
    ('c.j 20', False, True, False), ('c.jal 20', True, False, False),
    ('jalr a5', True, False, False), ('jalr ra,0(a5)', True, False, False),
    ('c.jalr a5', True, False, False), ('jr a5', False, True, False),
    ('ret', False, False, True), ('c.jr ra', False, True, True),
    ('jalr zero,0(ra)', False, True, True), ('jalr x0,x1,0', False, True, True),
    ('c.beqz a0,0', False, True, False), ('c.bnez a0,0', False, True, False),
])
def test_riscv_control_transfer_semantics(instruction, call, jump, sink):
    program = parse_program(['00000000 <f>:', f'0: 00000000 {instruction}'], 'riscv')
    inst = program.functions['f'].instructions[0]
    assert (inst.is_call(), inst.is_jump(), bool(inst.is_sink())) == (call, jump, sink)


def test_self_loop_and_address_zero_are_retained():
    function = parse_program(['00000000 <f>:', '0: a001 c.j 0 <f>'], 'riscv').functions['f']
    assert function.blocks[0].jump_edge == 0
    assert analyze_function(function).cycles == [(0,)]
    assert '0:s1 -> 0' in cfg_graph(function).source


def test_skip_calls_changes_blocks_but_preserves_call_graph():
    normal = parse_program(RISCV.splitlines(), 'riscv')
    skipped = parse_program(RISCV.splitlines(), 'riscv', skip_calls=True)
    assert len(skipped.functions['worker'].blocks) < len(normal.functions['worker'].blocks)
    assert call_sites(normal) == call_sites(skipped)


def test_data_pointer_comment_is_not_a_proven_callee():
    program = parse_program(['00000010 <main>:',
                             '10: ff 15 00 00 00 00 call *0x10(%rip) # 20 <callee>',
                             '16: c3 ret', '00000020 <callee>:', '20: c3 ret'], 'x86')
    site = call_sites(program)[0]
    assert site.kind == 'indirect-call'
    assert site.external
    assert site.callee != 'callee'


def test_sources_are_annotations_and_state_is_local():
    lines = ['00000000 <f>:', '/example/demo.c:4', 'if (x) {', '0: 8082 ret', '}']
    first = parse_program(lines, 'riscv')
    second = parse_program(lines, 'riscv')
    assert len(first.functions['f'].instructions) == 1
    assert first.functions['f'].instructions[0].annotations == ['/example/demo.c:4', 'if (x) {']
    assert list(first.functions['f'].blocks) == list(second.functions['f'].blocks) == [0]


def test_recursive_calls_are_separate_from_cfg_loops():
    program = parse_program(['00000010 <f>:', '10: e8 00 00 00 00 call 10 <f>', '15: c3 ret'], 'x86')
    assert call_sites(program)[0].callee == 'f'
    assert analyze_function(program.functions['f']).cycles == []
    assert 'fillcolor=' in call_graph(program).source


def test_tail_transfer_has_no_fallthrough():
    program = parse_program(['00000000 <f>:', '0: 0000006f jal zero,20 <g>',
                             '4: 8082 ret', '00000020 <g>:', '20: 8082 ret'], 'riscv')
    assert program.functions['f'].blocks[0].no_jump_edge is None
    assert call_sites(program)[0].callee == 'g'
    assert call_sites(program)[0].kind == 'tail-call'


def test_indirect_jump_preserves_unknown_in_json(tmp_path):
    source = tmp_path / 'indirect.asm'
    source.write_text('00000000 <f>:\n0: 8782 jr a5\n2: 8082 ret\n')
    assert main([str(source), '--format', 'json', '-o', str(tmp_path)]) == 0
    function = json.loads((tmp_path / 'analysis.json').read_text())['functions'][0]
    assert function['blocks'][0]['unresolved_jump']
    assert not function['indirect_jumps_resolved']
    assert function['dominator_scope'] == 'known CFG edges only'


def test_address_merge_fills_missing_fields_and_detects_conflicts():
    address = Address(None, 'f', 0)
    address.merge(Address(0, 'f', None))
    assert address.abs == 0
    with pytest.raises(ValueError, match='Conflicting'):
        address.merge(Address(8))


def test_diamond_dominance_and_unreachable_nodes():
    graph = {0: (1, 2), 1: (3,), 2: (3,), 3: (4,), 4: (), 99: (3,)}
    assert immediate_dominators(graph, 0) == {0: 0, 1: 0, 2: 0, 3: 0, 4: 3}


def test_iterative_algorithms_handle_deep_graph():
    size = 10000
    graph = {node: (node + 1,) for node in range(size - 1)}
    graph[size - 1] = (0,)
    components = strongly_connected_components(graph)
    assert len(components) == 1 and len(components[0]) == size
    dominators = immediate_dominators(graph, 0)
    assert len(dominators) == size and dominators[size - 1] == size - 2


def test_graph_algorithms_against_independent_networkx_oracle():
    rng = random.Random(24)
    for _ in range(100):
        size = rng.randrange(1, 35)
        graph = {node: tuple(child for child in range(size) if rng.random() < 0.13) for node in range(size)}
        oracle = nx.DiGraph(graph)
        assert {frozenset(c) for c in strongly_connected_components(graph)} == {
            frozenset(c) for c in nx.strongly_connected_components(oracle)}
        assert immediate_dominators(graph, 0) == nx.immediate_dominators(oracle, 0)


def test_cli_uses_input_and_renders_real_svg(tmp_path):
    source = tmp_path / 'input.asm'
    source.write_text(RISCV)
    assert main([str(source), '--dominators', '-o', str(tmp_path / 'out')]) == 0
    for name in ('main', 'worker', 'calls'):
        data = (tmp_path / 'out' / f'{name}.svg').read_text()
        assert '<svg' in data and '</svg>' in data
    assert main([str(tmp_path / 'missing.asm')]) == 1


def test_render_timeout_does_not_write_partial_output(tmp_path, monkeypatch):
    def timeout(*args, **kwargs):
        raise subprocess.TimeoutExpired('dot', 0.001)
    monkeypatch.setattr(subprocess, 'run', timeout)
    destination = tmp_path / 'graph.svg'
    with pytest.raises(subprocess.TimeoutExpired):
        write_graph(call_graph(parse_program(RISCV.splitlines(), 'riscv')), destination, timeout=0.001)
    assert not destination.exists()


def test_offline_html_report_embeds_both_graph_types(tmp_path):
    source = tmp_path / 'input.asm'
    source.write_text(RISCV)
    assert main([str(source), '--format', 'html', '--dominators', '-o', str(tmp_path)]) == 0
    report = (tmp_path / 'report.html').read_text()
    assert report.count('data:image/svg+xml;base64,') == 3
    assert '呼叫圖 / Call graph' in report and 'lang="zh-Hant"' in report
    assert '<script src=' not in report


@pytest.mark.parametrize('arch,target', [('i386:x86-64', 'x86'), ('armv7', 'arm'), ('riscv:rv64', 'riscv')])
def test_gdb_architecture_selection(arch, target):
    assert target_from_gdb_arch(arch) == target


def test_empty_input_and_multiple_functions_are_explicit_errors():
    from src.asm2cfg.parser import parse_lines
    with pytest.raises(ParseError, match='No instructions'):
        parse_program([], 'riscv')
    with pytest.raises(ParseError, match='Multiple functions'):
        parse_lines(RISCV.splitlines(), False, 'riscv')


def test_sanitized_function_names_cannot_escape_output_directory(tmp_path):
    source = tmp_path / 'input.asm'
    source.write_text('00000000 <../../escape>:\n0: c3 ret\n00000010 <calls>:\n10: c3 ret\n')
    output = tmp_path / 'out'
    assert main([str(source), '--target', 'x86', '--format', 'dot', '-o', str(output)]) == 0
    assert len(list(output.glob('*.dot'))) == 3
    assert not (tmp_path / 'escape.dot').exists()


def test_module_returns_nonzero_for_missing_input():
    result = subprocess.run([sys.executable, '-m', 'src.asm2cfg', '/nonexistent/asm2cfg-input.asm'],
                            capture_output=True, text=True, cwd=Path(__file__).resolve().parents[1], check=False)
    assert result.returncode == 1
    assert 'asm2cfg:' in result.stderr and 'Traceback' not in result.stderr
