"""Recover real compiler-generated tables and compare them with executed jump targets."""

import json
import re
import subprocess
from pathlib import Path

import pytest

from src.asm2cfg.analysis import analyze_function
from src.asm2cfg.command_line import main
from src.asm2cfg.jumptables import recover_jump_tables
from src.asm2cfg.memory import MemoryImage
from src.asm2cfg.parser import parse_program
from src.asm2cfg.render import cfg_graph, write_graph

SOURCE = Path(__file__).parent / 'fixtures/switch.c'


def compile_switch(directory, pie):
    binary = directory / 'switch'
    flags = ['-fpie', '-pie'] if pie else ['-fno-pie', '-no-pie']
    subprocess.run(['gcc', '-O2', '-fno-tree-switch-conversion', '-fno-optimize-sibling-calls',
                    *flags, str(SOURCE), '-o', str(binary)], check=True, capture_output=True)
    return binary


def disassemble(binary, syntax='att'):
    return subprocess.check_output(['objdump', '-d', '-M', syntax, str(binary)], text=True)


@pytest.mark.parametrize('pie', [False, True])
@pytest.mark.parametrize('syntax', ['att', 'intel'])
def test_real_compiler_tables_and_svg(tmp_path, pie, syntax):
    binary = compile_switch(tmp_path, pie)
    program = parse_program(disassemble(binary, syntax).splitlines(), 'x86')
    recover_jump_tables(program, MemoryImage.from_elf(binary))
    function = program.functions['dispatch']
    assert len(function.jump_tables) == 1
    table = function.jump_tables[0]
    assert table.kind == ('relative32' if pie else 'absolute')
    assert len(table.targets) == 8
    assert all(target in function.blocks for target in table.targets)
    assert analyze_function(function).complete
    svg = write_graph(cfg_graph(function, dominators=True), tmp_path / 'switch.svg').read_text()
    assert 'Switch' in svg and 'index 7' in svg
    assert 'unresolved indirect jump' not in svg
    assert not program.diagnostics


@pytest.mark.parametrize('pie', [False, True])
def test_table_entries_match_actual_executed_indirect_jump(tmp_path, pie):
    binary = compile_switch(tmp_path, pie)
    program = parse_program(disassemble(binary).splitlines(), 'x86')
    recover_jump_tables(program, MemoryImage.from_elf(binary))
    function = program.functions['dispatch']
    table = function.jump_tables[0]
    offset = table.jump_address - function.entry
    script = tmp_path / 'trace.gdb'
    script.write_text(f'''set pagination off
set confirm off
start
python
base = int(gdb.parse_and_eval('(void*)dispatch')) - {function.entry}
breakpoint = gdb.Breakpoint('*((char*)dispatch + {offset})', internal=True)
for index in range(8):
    gdb.execute('continue', to_string=True)
    gdb.execute('stepi', to_string=True)
    print('JTABLE_TARGET:%x' % (int(gdb.parse_and_eval('$pc')) - base))
breakpoint.delete()
end
continue
''')
    result = subprocess.run(['gdb', '-q', '-nx', '--batch', '-x', str(script), str(binary)],
                            capture_output=True, text=True, timeout=15, check=True)
    actual = tuple(int(value, 16) for value in re.findall(r'JTABLE_TARGET:([0-9a-f]+)', result.stdout))
    assert actual == table.targets, result.stdout + result.stderr


def test_no_table_data_keeps_unknown(tmp_path):
    binary = compile_switch(tmp_path, True)
    program = parse_program(disassemble(binary).splitlines(), 'x86')
    function = program.functions['dispatch']
    assert not function.jump_tables
    assert any(block.unresolved_jump for block in function.blocks.values())
    assert not analyze_function(function).complete


@pytest.mark.parametrize('kind', ['truncated', 'invalid-target', 'inside-dispatch'])
def test_invalid_entries_do_not_produce_partial_or_guessed_edges(tmp_path, kind):
    binary = compile_switch(tmp_path, True)
    lines = disassemble(binary).splitlines()
    program = parse_program(lines, 'x86')
    image = MemoryImage.from_elf(binary)
    recover_jump_tables(program, image)
    table = program.functions['dispatch'].jump_tables[0]
    content = image.read(table.table_address, 8 * 4)
    if kind == 'truncated':
        content = content[:-1]
    elif kind == 'invalid-target':
        content = b'\x00\x00\x00\x00' + content[4:]
    else:
        content = (table.jump_address - table.table_address).to_bytes(4, 'little', signed=True) + content[4:]
    program = parse_program(lines, 'x86')
    recover_jump_tables(program, MemoryImage([(table.table_address, content)]))
    function = program.functions['dispatch']
    assert not function.jump_tables
    assert any(block.unresolved_jump for block in function.blocks.values())
    assert program.diagnostics


def test_objdump_section_bytes_and_cli(tmp_path):
    binary = compile_switch(tmp_path, True)
    text = disassemble(binary)
    assembly = tmp_path / 'switch.asm'
    assembly.write_text(text)
    data = tmp_path / 'rodata.txt'
    data.write_text(subprocess.check_output(['objdump', '-s', '-j', '.rodata', str(binary)], text=True))
    assert main([str(assembly), '--target', 'x86', '--table-data', str(data),
                 '--format', 'json', '-o', str(tmp_path / 'data-report')]) == 0
    report = json.loads((tmp_path / 'data-report/analysis.json').read_text())
    function = next(function for function in report['functions'] if function['name'] == 'dispatch')
    assert len(function['jump_tables'][0]['targets']) == 8
    assert main([str(assembly), '--target', 'x86', '--binary', str(binary),
                 '--format', 'html', '--function', 'dispatch', '--graph', 'cfg',
                 '-o', str(tmp_path / 'binary-report')]) == 0
    assert 'data:image/svg+xml;base64,' in (tmp_path / 'binary-report/report.html').read_text()


def test_binary_must_match_disassembly(tmp_path):
    binary = compile_switch(tmp_path, True)
    text = disassemble(binary).replace('f3 0f 1e fa', 'f3 0f 1e fb', 1)
    assembly = tmp_path / 'mismatched.asm'
    assembly.write_text(text)
    assert main([str(assembly), '--target', 'x86', '--binary', str(binary),
                 '--format', 'json', '-o', str(tmp_path / 'out')]) == 1
    assert not (tmp_path / 'out/analysis.json').exists()


def test_unguarded_index_is_not_scanned(tmp_path):
    binary = compile_switch(tmp_path, True)
    lines = disassemble(binary).splitlines()
    program = parse_program(lines, 'x86')
    function = program.functions['dispatch']
    guard = next(inst for inst in function.instructions if inst.mnemonic == 'ja')
    # Replacing the range check with a non-branch removes evidence of table length.
    guard.opcode, guard.body, guard.ops = 'nop', 'nop', []
    from src.asm2cfg.cfg import build_cfg
    build_cfg(function)
    recover_jump_tables(program, MemoryImage.from_elf(binary))
    assert not function.jump_tables


def test_elf32_absolute_table_without_external_libraries(tmp_path):
    source = tmp_path / 'switch32.s'
    source.write_text('''.text
.globl dispatch
.type dispatch,@function
dispatch:
    cmp $2,%eax
    ja .Ldefault
    jmp *.Ltable(,%eax,4)
.Lzero:
    mov $11,%eax
    ret
.Lone:
    mov $22,%eax
    ret
.Ltwo:
    mov $33,%eax
    ret
.Ldefault:
    mov $-1,%eax
    ret
.size dispatch,.-dispatch
.section .rodata
.align 4
.Ltable:
    .long .Lzero,.Lone,.Ltwo
.section .note.GNU-stack,"",@progbits
''')
    binary = tmp_path / 'switch32'
    subprocess.run(['gcc', '-m32', '-nostdlib', '-no-pie', '-Wl,-e,dispatch',
                    str(source), '-o', str(binary)], check=True, capture_output=True)
    image = MemoryImage.from_elf(binary)
    assert image.bits == 32
    program = parse_program(disassemble(binary).splitlines(), 'x86')
    recover_jump_tables(program, image)
    table = program.functions['dispatch'].jump_tables[0]
    assert table.kind == 'absolute' and table.entry_size == 4 and len(table.targets) == 3


@pytest.mark.parametrize('content', [b'not an elf', b'\x7fELF' + bytes(60)])
def test_malformed_binary_is_a_clean_input_error(tmp_path, content):
    binary = tmp_path / 'bad'
    binary.write_bytes(content)
    with pytest.raises(ValueError):
        MemoryImage.from_elf(binary)
