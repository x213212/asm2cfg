"""Public single-function API. Implementation lives in focused modules."""

from .model import Address, BasicBlock, Encoding, InputFormat, Instruction, escape
from .parser import (HEX_LONG_PATTERN, HEX_PATTERN, ParseError, parse_address, parse_body,
                     parse_comment, parse_encoding, parse_function_header, parse_line,
                     parse_lines, parse_program, parse_target, read_lines, split_nth)
from .render import draw_cfg
from .targets import ARMTargetInfo, RiscVTargetInfo, X86TargetInfo

__all__ = ['Address', 'BasicBlock', 'Encoding', 'InputFormat', 'Instruction', 'escape',
           'HEX_LONG_PATTERN', 'HEX_PATTERN', 'ParseError', 'parse_address', 'parse_body',
           'parse_comment', 'parse_encoding', 'parse_function_header', 'parse_line',
           'parse_lines', 'parse_program', 'parse_target', 'read_lines', 'split_nth',
           'draw_cfg', 'ARMTargetInfo', 'RiscVTargetInfo', 'X86TargetInfo']
