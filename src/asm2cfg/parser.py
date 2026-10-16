"""Parse GDB/objdump text independently from graph construction and rendering."""

import re

from .model import Address, Encoding, Function, InputFormat, Instruction, Program
from .targets import target_info

HEX_PATTERN = r'[0-9a-fA-F]+'
HEX_LONG_PATTERN = r'(?:0x)?' + HEX_PATTERN


class ParseError(ValueError):
    """Invalid disassembly, with an input line in the diagnostic."""


def read_lines(file_path):
    with open(file_path, encoding='utf8') as source:
        return source.readlines()


def parse_function_header(line):
    match = re.match(r'^\s*[0-9a-fA-F]+\s+<(.+)>:\s*$', line)
    if match:
        return InputFormat.OBJDUMP, match[1]
    match = re.search(r'function (.+):\s*$', line)
    if match:
        return InputFormat.GDB, match[1]
    match = re.search(fr'(?:Address range|from) ({HEX_LONG_PATTERN}) to ({HEX_LONG_PATTERN}):\s*$', line)
    if match:
        return InputFormat.GDB, f'{match[1]}-{match[2]}'
    return None, None


def parse_address(line):
    match = re.match(fr'^\s*(?:0x)?({HEX_PATTERN})\s*(?:<([+-](?:0x[0-9a-fA-F]+|[0-9]+))>)?:(.*)', line)
    if match is None:
        return None, line
    offset = int(match[2], 0) if match[2] else None
    return Address(int(match[1], 16), offset=offset), match[3]


def split_nth(string, count):
    return [string[index:index + count] for index in range(0, len(string), count)]


def parse_encoding(line):
    match = re.match(r'^\s*((?:(?:[0-9a-fA-F]{8}|[0-9a-fA-F]{4}|[0-9a-fA-F]{2})(?:\s+|$))+)(.*)', line)
    if match is None:
        return None, line
    bites = [int(byte, 16) for chunk in match[1].split() for byte in split_nth(chunk, 2)]
    return Encoding(bites), match[2]


def _split_operands(text):
    # Keep commas within x86 memory operands and ARM register lists together.
    operands, start, depth = [], 0, 0
    for index, char in enumerate(text):
        if char in '([{':
            depth += 1
        elif char in ')]}':
            depth = max(0, depth - 1)
        elif char == ',' and depth == 0:
            operands.append(text[start:index].strip())
            start = index + 1
    if text:
        operands.append(text[start:].strip())
    return operands


def parse_body(line, info):
    match = re.match(fr'^\s*([^{re.escape(info.comment())}<]+)(.*)', line)
    if match is None or not match[1].strip():
        return None, None, None, line
    body, rest = match[1].strip(), match[2]
    # x86 prefixes belong to the instruction they qualify.
    opcode = re.match(r'^(?:(?:addr32|data16|notrack|bnd|lock|rep|repe|repz|repne|repnz)\s+)*\S+', body)[0]
    return body, opcode, _split_operands(body[len(opcode):].strip()), rest


def parse_target(line):
    match = re.match(r'\s*<(.+?)>(.*)', line)
    if match is None:
        return None, line
    symbol = re.match(r'^(.*?)([+-](?:0x[0-9a-fA-F]+|[0-9]+))?$', match[1])
    return Address(None, symbol[1], int(symbol[2], 0) if symbol[2] else 0), match[2]


def parse_comment(line, info):
    match = re.match(fr'^\s*{re.escape(info.comment())}\s*(.*)', line)
    if match is None:
        return None, line
    immediate = re.match(fr'^(?:0x)?({HEX_PATTERN})(?:\s*(<.*>))?\s*$', match[1])
    if immediate is None:
        return None, ''
    address = Address(int(immediate[1], 16))
    if immediate[2]:
        address, _ = parse_target(immediate[2])
        address.abs = int(immediate[1], 16)
    return address, ''


def parse_line(line, lineno, function_name, fmt, info):
    text = line.strip()
    if text.startswith('=>'):
        text = text[2:].lstrip()
    address, rest = parse_address(text)
    if address is None:
        return None
    encoding = None
    if fmt == InputFormat.OBJDUMP:
        encoding, rest = parse_encoding(rest)
        if not rest.strip():
            return encoding
    body, opcode, operands, rest = parse_body(rest, info)
    if opcode is None:
        return None
    target, rest = parse_target(rest)
    immediate, rest = parse_comment(rest, info)
    if rest.strip():
        return None
    address.base = function_name
    inst = Instruction(body, text, lineno, address, opcode, operands, target, immediate, info)
    inst.encoding = encoding
    return inst


def parse_program(lines, target_name='x86', skip_calls=False, source=''):
    """Parse all functions. Non-instruction source text is attached as annotations."""
    from .cfg import build_cfg  # Graph building depends only on the parsed model.

    info = target_info(target_name)
    program = Program()
    current, fmt, annotations = None, None, []
    for number, line in enumerate(lines, 1):
        new_format, name = parse_function_header(line)
        if name is not None:
            if name in program.functions:
                raise ParseError(f'{source}:{number}: duplicate function {name!r}')
            current = Function(name, [], source=source)
            program.functions[name] = current
            fmt, annotations = new_format, []
            continue
        if current is None or not line.strip() or line.startswith('End of assembler dump'):
            continue
        inst = parse_line(line, number, current.name, fmt, info)
        if isinstance(inst, Encoding):
            continue
        if inst is None:
            if parse_address(line.lstrip().removeprefix('=>').lstrip())[0] is not None:
                raise ParseError(f'{source}:{number}: invalid instruction: {line.strip()}')
            annotations.append(line.rstrip())
            continue
        inst.annotations, annotations = annotations, []
        current.instructions.append(inst)
    for function in program.functions.values():
        if not function.instructions:
            program.diagnostics.append(f'{function.name}: no instructions in input')
            continue
        build_cfg(function, skip_calls=skip_calls)
    if not any(function.instructions for function in program.functions.values()):
        raise ParseError('No instructions found; provide a GDB or objdump disassembly with function headers')
    return program


def parse_lines(lines, skip_calls=False, target_name='x86'):
    """Single-function API used by GDB and existing Python callers."""
    program = parse_program(lines, target_name, skip_calls)
    if len(program.functions) != 1:
        raise ParseError('Multiple functions found; use parse_program() to retain all functions')
    function = next(iter(program.functions.values()))
    return function.name, function.blocks
