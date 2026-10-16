"""Bounded recovery of guarded x86 absolute and relative switch tables."""

import re
from dataclasses import dataclass

from .analysis import immediate_dominators
from .cfg import adjacency, build_cfg
from .model import JumpTable
from .targets import X86TargetInfo

INDEX = object()
INDEX_LOW32 = object()


@dataclass(frozen=True)
class TableValue:
    address: int
    size: int
    kind: str


def _register(text):
    text = text.strip().lstrip('*%').lower()
    aliases = {'eax': 'rax', 'ebx': 'rbx', 'ecx': 'rcx', 'edx': 'rdx',
               'esi': 'rsi', 'edi': 'rdi', 'ebp': 'rbp', 'esp': 'rsp'}
    text = aliases.get(text, text)
    if re.fullmatch(r'r(?:ax|bx|cx|dx|si|di|bp|sp|[89]|1[0-5])d?', text):
        return text[:-1] if text.endswith('d') else text
    return None


def _integer(text):
    try:
        return int(text.strip().lstrip('$'), 0)
    except ValueError:
        return None


def _width(operand):
    register = operand.strip().lstrip('*%')
    return 4 if register.startswith('e') or register.endswith('d') else 8


def _memory(text, values):
    """Return (constant base, index scale); a scale of zero means no index."""
    text = text.strip().lstrip('*')
    match = re.fullmatch(r'([+-]?(?:0x[0-9a-fA-F]+|\d+))?\(([^,)]*)(?:,([^,)]*)(?:,(\d+))?)?\)', text)
    if match:
        base = _integer(match[1] or '0')
        if match[2]:
            value = values.get(_register(match[2]))
            if not isinstance(value, int):
                return None
            base += value
        scale = 0
        if match[3]:
            if values.get(_register(match[3])) is not INDEX:
                return None
            scale = int(match[4] or 1)
        return base, scale
    match = re.search(r'\[([^\]]+)\]', text)
    if match:
        base, scale = 0, 0
        expression = re.sub(r'\s+', '', match[1]).replace('-', '+-')
        for term in expression.split('+'):
            if not term:
                continue
            if '*' in term:
                register, multiplier = term.split('*', 1)
                if scale or values.get(_register(register)) is not INDEX or not multiplier.isdigit():
                    return None
                scale = int(multiplier)
            else:
                register = _register(term)
                value = values.get(register) if register else _integer(term)
                if value is INDEX and not scale:
                    scale = 1
                elif isinstance(value, int):
                    base += value
                else:
                    return None
        return base, scale
    return None


def _operands(inst):
    # AT&T writes its destination last; Intel writes it first.
    intel = not any(char in inst.body for char in '%$')
    operands = list(reversed(inst.ops)) if intel else inst.ops
    return operands


def _value(operand, values):
    register = _register(operand)
    value = values.get(register) if register else _integer(operand)
    if value is INDEX_LOW32 and _width(operand) != 4:
        return None
    return value


def _update(inst, values, next_address=None):
    operands = _operands(inst)
    opcode = inst.mnemonic
    if opcode.startswith(('nop', 'endbr', 'cmp', 'test')) or opcode in ('push', 'pushq'):
        return
    if inst.is_call() or opcode in ('mul', 'imul', 'div', 'idiv', 'cpuid', 'syscall', 'xchg'):
        values.clear()
        return
    if opcode not in ('mov', 'movl', 'movq', 'movslq', 'movsxd', 'lea', 'leaq', 'leal',
                      'add', 'addq', 'addl', 'sub', 'subq', 'subl'):
        values.clear()
        return
    if not operands:
        values.clear()
        return
    destination = _register(operands[-1])
    if destination is None:
        # Partial-register writes can invalidate a full-width index or table base.
        if not any(char in operands[-1] for char in '(['):
            values.clear()
        return
    old = values.pop(destination, None)
    if len(operands) != 2:
        return
    source = operands[0]
    # Preserve a register copied into itself while applying the transfer.
    incoming = dict(values)
    if old is not None:
        incoming[destination] = old
    if opcode in ('mov', 'movl', 'movq', 'movslq', 'movsxd'):
        value = _value(source, incoming)
        memory = _memory(source, incoming)
        if memory is not None and memory[1] in (4, 8):
            signed = opcode in ('movslq', 'movsxd')
            width = 4 if signed else _width(operands[-1])
            if memory[1] != width:
                return
            value = TableValue(memory[0], memory[1], 'offset32' if signed else 'absolute')
        if _width(operands[-1]) == 4 and (value is INDEX or value is INDEX_LOW32):
            value = INDEX
        if value is not None:
            values[destination] = value
    elif opcode in ('lea', 'leaq', 'leal'):
        if re.search(r'\brip\b', source):
            displacement = re.search(r'([+-]?(?:0x[0-9a-fA-F]+|\d+))\(%rip\)', source)
            if displacement is None:
                displacement = re.search(r'\[rip\s*([+-]\s*(?:0x[0-9a-fA-F]+|\d+))\]', source)
            following = inst.address.abs + inst.encoding.size() if inst.encoding is not None else next_address
            if displacement is not None and following is not None:
                values[destination] = following + int(displacement[1].replace(' ', ''), 0)
        else:
            memory = _memory(source, incoming)
            if memory is not None and memory[1] == 0:
                values[destination] = memory[0]
    elif opcode in ('add', 'addq', 'addl'):
        value = _value(source, incoming)
        if isinstance(old, TableValue) and old.kind == 'offset32' and value == old.address:
            values[destination] = TableValue(old.address, 4, 'relative32')
        elif isinstance(old, int) and isinstance(value, int):
            values[destination] = old + value
    elif opcode in ('sub', 'subq', 'subl'):
        value = _value(source, incoming)
        if isinstance(old, int) and isinstance(value, int):
            values[destination] = old - value


def _zero_extended(guard, register):
    """A preceding 32-bit register write establishes known zero upper bits on x86-64."""
    for inst in reversed(guard.instructions[:-2]):
        if inst.is_call() or not inst.ops:
            return False
        if inst.mnemonic.startswith(('cmp', 'test', 'nop', 'endbr')):
            continue
        operands = _operands(inst)
        if _register(operands[-1]) == register:
            return _width(operands[-1]) == 4 and inst.mnemonic in (
                'mov', 'movl', 'xor', 'xorl', 'and', 'andl', 'sub', 'subl', 'add', 'addl', 'lea', 'leal')
        if inst.mnemonic not in ('mov', 'movl', 'movq', 'lea', 'leal', 'leaq'):
            return False
    return False


def _bounded_paths(function, dispatch):
    graph = adjacency(function.blocks)
    dominators = immediate_dominators(graph, function.entry)
    ancestors, seen, node = [], set(), dispatch.key
    while node in dominators and node not in seen:
        ancestors.append(node)
        seen.add(node)
        node = dominators[node]
    predecessors = {key: set() for key in graph}
    for source, targets in graph.items():
        for target in targets:
            predecessors[target].add(source)
    for key in ancestors:
        guard = function.blocks[key]
        if len(guard.instructions) < 2 or guard.instructions[-1].mnemonic not in ('ja', 'jae'):
            continue
        if guard.jump_edge == guard.no_jump_edge:
            continue
        compare = guard.instructions[-2]
        if compare.mnemonic not in ('cmp', 'cmpl', 'cmpq') or len(compare.ops) != 2:
            continue
        operands = _operands(compare)
        upper, register = _integer(operands[0]), _register(operands[1])
        if upper is None or register is None or upper < 0:
            continue
        count = upper + (1 if guard.instructions[-1].mnemonic == 'ja' else 0)
        if not 0 < count <= 4096:
            continue
        sequence, visited = [], {key}
        parent, node = key, guard.no_jump_edge
        while node in function.blocks and node not in visited:
            if predecessors[node] != {parent}:
                break
            visited.add(node)
            block = function.blocks[node]
            sequence.extend(block.instructions)
            if node == dispatch.key:
                yield register, _width(operands[1]), _zero_extended(guard, register), count, sequence
                break
            if block.jump_edge is not None or block.table_edges or block.unresolved_jump:
                break
            parent, node = node, block.no_jump_edge


def _describe(function, dispatch, bits=64):
    jump = dispatch.instructions[-1]
    if not isinstance(jump.info, X86TargetInfo) or not jump.is_unconditional_jump() or jump.is_direct_jump():
        return None
    for register, width, zero_extended, count, sequence in _bounded_paths(function, dispatch):
        narrow = width == 4 and bits == 64 and not zero_extended
        values = {register: INDEX_LOW32 if narrow else INDEX}
        for position, inst in enumerate(sequence[:-1]):
            _update(inst, values, sequence[position + 1].address.abs)
        target = jump.ops[0] if jump.ops else ''
        table = values.get(_register(target))
        if table is None:
            memory = _memory(target, values)
            if memory is not None and memory[1] in (4, 8):
                table = TableValue(memory[0], memory[1], 'absolute')
        if isinstance(table, TableValue) and table.kind in ('relative32', 'absolute'):
            return table, count, {inst.address.abs for inst in sequence}
    return None


def recover_jump_tables(program, memory, skip_calls=False):
    """Resolve guarded, immutable tables; accept all entries or leave the jump unknown."""
    for function in program.functions.values():
        instructions = {inst.address.abs for inst in function.instructions}
        candidates = [block for block in function.blocks.values() if block.unresolved_jump]
        recovered = []
        for block in candidates:
            description = _describe(function, block, memory.bits)
            if description is None:
                continue
            table, count, preparation = description
            try:
                if table.kind == 'absolute' and table.size != memory.bits // 8:
                    raise ValueError('Absolute entry width does not match the ELF address width')
                content = memory.read(table.address, count * table.size)
                targets = tuple(int.from_bytes(content[index:index + table.size], 'little',
                                               signed=table.kind == 'relative32') +
                                (table.address if table.kind == 'relative32' else 0)
                                for index in range(0, len(content), table.size))
                if any(target not in instructions or target in preparation for target in targets):
                    raise ValueError('An entry does not name a case instruction outside the dispatch sequence')
            except ValueError as error:
                program.diagnostics.append(f'{function.name}:0x{block.instructions[-1].address.abs:x}: '
                                           f'jump table unresolved: {error}')
                continue
            recovered.append(JumpTable(block.instructions[-1].address.abs, table.address,
                                       table.size, table.kind, targets))
        function.jump_tables = recovered
        if not recovered:
            continue
        build_cfg(function, skip_calls)
        # New case edges can reveal previously unreachable predecessors. Recheck the guard.
        while True:
            valid = []
            for table in function.jump_tables:
                block = next(block for block in function.blocks.values()
                             if block.instructions[-1].address is not None and
                             block.instructions[-1].address.abs == table.jump_address)
                description = _describe(function, block, memory.bits)
                if description is not None and description[0] == TableValue(
                        table.table_address, table.entry_size, table.kind) and description[1] == len(table.targets):
                    valid.append(table)
                else:
                    program.diagnostics.append(f'{function.name}:0x{table.jump_address:x}: '
                                               'jump table unresolved: case edges invalidate the index guard')
            if len(valid) == len(function.jump_tables):
                break
            function.jump_tables = valid
            build_cfg(function, skip_calls)
    return program
