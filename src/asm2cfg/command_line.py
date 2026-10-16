"""Command-line orchestration; all input paths come from arguments."""

import argparse
import json
import subprocess
import sys
from pathlib import Path

from .model import Program
from .parser import ParseError, parse_program, read_lines
from .render import call_graph, cfg_graph, safe_filename, write_graph
from .report import html_report, program_report
from .jumptables import recover_jump_tables
from .memory import MemoryImage


def argument_parser():
    parser = argparse.ArgumentParser(description='Draw CFGs and call graphs from GDB or objdump disassembly.')
    parser.add_argument('assembly_file', nargs='+', help='Assembly dumps; distinct functions can span multiple files')
    parser.add_argument('--target', choices=['x86', 'arm', 'riscv'], default='riscv')
    parser.add_argument('-c', '--skip-calls', action='store_true',
                        help='Keep calls within their surrounding CFG blocks')
    parser.add_argument('--graph', choices=['cfg', 'calls', 'both'], default='both')
    parser.add_argument('--format', choices=['svg', 'pdf', 'png', 'dot', 'json', 'html'], default='svg')
    parser.add_argument('-o', '--output-dir', type=Path, default=Path('.'))
    parser.add_argument('--function', action='append', help='Render only this function CFG; repeat to select more')
    parser.add_argument('--dominators', action='store_true', help='Highlight immediate dominators (issue #24)')
    parser.add_argument('--no-loops', action='store_true', help='Disable Tarjan SCC cycle coloring')
    parser.add_argument('--direction', choices=['horizontal', 'vertical'], default='horizontal',
                        help='Arrange graphs left-to-right (default) or top-to-bottom')
    parser.add_argument('--render-timeout', type=float, default=30, metavar='SECONDS')
    memory = parser.add_mutually_exclusive_group()
    memory.add_argument('--binary', type=Path, help='Read jump-table bytes from the matching linked x86 ELF')
    memory.add_argument('--table-data', type=Path, help='Read jump-table bytes from objdump -s section contents')
    parser.add_argument('-v', '--view', action='store_true', help='Open the generated graph with the system viewer')
    return parser


def main(argv=None):
    parser = argument_parser()
    args = parser.parse_args(argv)
    if args.render_timeout <= 0:
        parser.error('--render-timeout must be greater than zero')
    try:
        program = Program()
        for filename in args.assembly_file:
            parsed = parse_program(read_lines(filename), args.target, args.skip_calls, source=filename)
            duplicates = program.functions.keys() & parsed.functions.keys()
            if duplicates:
                raise ParseError('Duplicate function names across inputs: ' + ', '.join(sorted(duplicates)) +
                                 '. Render versions separately and open compare.html for side-by-side viewing.')
            program.functions.update(parsed.functions)
            program.diagnostics.extend(parsed.diagnostics)
        if args.binary or args.table_data:
            if args.target != 'x86':
                raise ParseError('Jump-table recovery currently supports --target x86')
            image = MemoryImage.from_elf(args.binary) if args.binary else MemoryImage.from_objdump(
                read_lines(args.table_data))
            if args.binary:
                for function in program.functions.values():
                    for inst in function.instructions:
                        if inst.encoding is not None and image.read(inst.address.abs, inst.encoding.size()) != bytes(
                                inst.encoding.bites):
                            raise ParseError(f'Binary/disassembly mismatch at 0x{inst.address.abs:x}')
            recover_jump_tables(program, image, args.skip_calls)
        selected = args.function or list(program.functions)
        for name in selected:
            if name not in program.functions:
                raise ParseError(f'Function {name!r} not found in input')
        args.output_dir.mkdir(parents=True, exist_ok=True)
        if args.format == 'json':
            destination = args.output_dir / 'analysis.json'
            data = json.dumps(program_report(program), ensure_ascii=False, indent=2) + '\n'
            destination.write_text(data, encoding='utf8')
            print(f'Saved analysis to {destination}')
            return 0
        graphs = []
        if args.graph in ('cfg', 'both'):
            used = set()
            for number, name in enumerate(dict.fromkeys(selected), 1):
                stem = safe_filename(name)
                if stem in used or (stem == 'calls' and args.graph == 'both'):
                    stem += f'_{number}'
                while stem in used:
                    stem += '_'
                used.add(stem)
                graphs.append((stem, cfg_graph(program.functions[name], loops=not args.no_loops,
                                               dominators=args.dominators, direction=args.direction)))
        if args.graph in ('calls', 'both'):
            graphs.insert(0, ('calls', call_graph(program, direction=args.direction)))
        if args.format == 'html':
            destination = args.output_dir / 'report.html'
            destination.write_text(html_report(graphs, program, args.render_timeout), encoding='utf8')
            print(f'Saved report to {destination}')
            if args.view:
                from graphviz.backend import view as open_viewer
                open_viewer(str(destination.resolve()))
            return 0
        for stem, graph in graphs:
            destination = write_graph(graph, args.output_dir / f'{stem}.{args.format}',
                                      args.format, args.render_timeout)
            print(f'Saved graph to {destination}')
            if args.view:
                from graphviz.backend import view as open_viewer
                open_viewer(str(destination.resolve()))
        for message in program.diagnostics:
            print(f'warning: {message}', file=sys.stderr)
        return 0
    except (OSError, ValueError, subprocess.SubprocessError) as exc:
        print(f'asm2cfg: {exc}', file=sys.stderr)
        return 1
