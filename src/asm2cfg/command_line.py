"""
Command-line usage support.
"""

import argparse
from . import asm2cfg


def main():
    """ Command-line entry point to the program. """
    parser = argparse.ArgumentParser(
        description='Program to draw dot control-flow graph from GDB disassembly for a function.',
        epilog='If function CFG rendering takes too long, try to skip function calls with -c flag.'
    )
    parser.add_argument('assembly_file',
                        help='File to contain one function assembly dump')
    parser.add_argument('-c', '--skip-calls', action='store_true',
                        help='Skip function calls from dividing code to blocks')
    parser.add_argument('--target', choices=['x86', 'arm','riscv'], default='riscv',
                        help='Specify target platform for assembly')
    parser.add_argument('-v', '--view', action='store_true',
                        help='View as a dot graph instead of saving to a file')
    args = parser.parse_args()
    print('If function CFG rendering takes too long, try to skip function calls with -c flag')
    get_print_list =[]
    get_asm_file=[]
    
    # lines = asm2cfg.read_lines(args.assembly_file)
    lines = asm2cfg.read_lines("/root/asm2cfg/a.asm")
    get_asm_file.append(lines)
    lines2 = asm2cfg.read_lines("/root/asm2cfg/a2.asm")
    get_asm_file.append(lines2)
    for asm in get_asm_file:
        function_name, basic_blocks = asm2cfg.parse_lines(asm, args.skip_calls, args.target)
        get_print_list.append(  [function_name, basic_blocks ])

    print("start draw")

    asm2cfg.draw_cfg(function_name,get_print_list, args.view)
