"""Architecture rules for control transfers; no graph or output state."""

import re


def hex_operand(operand):
    operand = operand.strip()
    if re.fullmatch(r'(?:0x)?[0-9a-fA-F]+', operand):
        return int(operand, 16)
    return None


class X86TargetInfo:
    def comment(self):
        return '#'

    def is_call(self, inst):
        return inst.mnemonic in ('call', 'callq', 'calll', 'lcall')

    def is_jump(self, inst):
        return inst.mnemonic.startswith('j') or inst.mnemonic.startswith('loop')

    def is_unconditional_jump(self, inst):
        return inst.mnemonic in ('jmp', 'jmpq', 'jmpl', 'ljmp')

    def is_sink(self, inst):
        return inst.mnemonic.startswith(('ret', 'iret')) or inst.mnemonic in ('ud2', 'hlt')

    def direct_target(self, inst):
        if (self.is_jump(inst) or self.is_call(inst)) and inst.ops:
            return hex_operand(inst.ops[0])
        return None


class RiscVTargetInfo:
    BRANCHES = frozenset(('beq', 'bne', 'blt', 'bge', 'bltu', 'bgeu', 'beqz', 'bnez',
                          'blez', 'bgez', 'bltz', 'bgtz', 'bgt', 'ble', 'bgtu', 'bleu',
                          'c.beqz', 'c.bnez'))
    LINK_REGISTERS = frozenset(('ra', 'x1', 't0', 'x5'))

    def comment(self):
        return '#'

    def is_call(self, inst):
        op = inst.mnemonic
        if op in ('call', 'c.jal', 'c.jalr'):
            return True
        if op in ('jal', 'jalr'):
            # The one-operand pseudoinstructions use ra as destination.
            return len(inst.ops) == 1 or bool(inst.ops and inst.ops[0] in self.LINK_REGISTERS)
        return False

    def is_jump(self, inst):
        return (inst.mnemonic in self.BRANCHES or inst.mnemonic in
                ('j', 'c.j', 'jr', 'c.jr', 'jal', 'jalr', 'tail')) and not self.is_call(inst)

    def is_unconditional_jump(self, inst):
        return self.is_jump(inst) and inst.mnemonic not in self.BRANCHES

    def is_sink(self, inst):
        if inst.mnemonic == 'ret':
            return True
        if inst.mnemonic in ('jr', 'c.jr'):
            return inst.ops == ['ra'] or inst.ops == ['x1']
        if inst.mnemonic == 'jalr' and inst.ops and inst.ops[0] in ('zero', 'x0'):
            return inst.ops[1:] in (['ra', '0'], ['x1', '0'], ['0(ra)'], ['0(x1)'])
        return False

    def direct_target(self, inst):
        op = inst.mnemonic
        if op in self.BRANCHES or op in ('j', 'c.j', 'jal', 'c.jal', 'call', 'tail'):
            return hex_operand(inst.ops[-1]) if inst.ops else None
        # A jalr annotation may name a GOT slot, not the runtime callee.
        return None


class ARMTargetInfo:
    CONDITIONS = frozenset(('eq', 'ne', 'cs', 'hs', 'cc', 'lo', 'mi', 'pl', 'vs', 'vc',
                            'hi', 'ls', 'ge', 'lt', 'gt', 'le', 'al'))

    def comment(self):
        return ';'

    def is_call(self, inst):
        op = inst.mnemonic.split('.')[0]
        return op in ('bl', 'blx') or any(
            op == prefix + cond for prefix in ('bl', 'blx') for cond in self.CONDITIONS)

    def is_jump(self, inst):
        op = inst.mnemonic.split('.')[0]
        return (op in ('b', 'bx', 'cbz', 'cbnz', 'tbb', 'tbh') or
                op in {'b' + cond for cond in self.CONDITIONS}) and not self.is_call(inst)

    def is_unconditional_jump(self, inst):
        return inst.mnemonic.split('.')[0] in ('b', 'bx', 'tbb', 'tbh')

    def is_sink(self, inst):
        op = inst.mnemonic.split('.')[0]
        return (op == 'bx' and inst.ops == ['lr']) or op == 'udf' or bool(
            op == 'pop' and re.search(r'\bpc\b', inst.body))

    def direct_target(self, inst):
        if (self.is_jump(inst) or self.is_call(inst)) and inst.ops:
            return hex_operand(inst.ops[-1])
        return None


def target_info(name):
    targets = {'x86': X86TargetInfo, 'arm': ARMTargetInfo, 'riscv': RiscVTargetInfo}
    try:
        return targets[name]()
    except KeyError as exc:
        raise ValueError(f'Unsupported platform {name!r}; choose x86, arm or riscv') from exc


def target_from_gdb_arch(name):
    if name.startswith(('i386', 'x86')):
        return 'x86'
    if name.startswith('riscv'):
        return 'riscv'
    if name.startswith('arm'):
        return 'arm'
    raise ValueError(f'Unsupported GDB architecture: {name}')
