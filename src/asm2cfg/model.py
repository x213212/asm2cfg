"""Data shared by assembly parsing, graph analysis and rendering."""

from dataclasses import dataclass, field


class InputFormat:
    GDB = 'GDB'
    OBJDUMP = 'OBJDUMP'


@dataclass
class Address:
    abs: object
    base: object = None
    offset: object = None

    def is_absolute(self):
        return self.base is None

    def is_relative(self):
        return not self.is_absolute()

    def merge(self, other):
        for name in ('abs', 'base', 'offset'):
            value = getattr(other, name)
            current = getattr(self, name)
            if current is not None and value is not None and current != value:
                raise ValueError(f'Conflicting address {name}: {current!r} and {value!r}')
            if value is not None:
                setattr(self, name, value)

    def __str__(self):
        absolute = f'0x{self.abs:x}' if self.abs is not None else '?'
        if self.offset is not None:
            return f'{absolute} ({self.base}+{self.offset})'
        return absolute


@dataclass
class Encoding:
    bites: list

    def size(self):
        return len(self.bites)

    def __str__(self):
        return ' '.join(f'{byte:02x}' for byte in self.bites)


class Instruction:
    """A real instruction. Source annotations never receive invented addresses."""

    def __init__(self, body, text, lineno, address, opcode, ops, target, imm, target_info):
        self.body = body
        self.text = text
        self.lineno = lineno
        self.address = address
        self.opcode = opcode
        self.ops = ops
        self.target = target
        self.comment_target = imm
        self.info = target_info
        self.encoding = None
        self.annotations = []
        if imm is not None and (self.is_jump() or self.is_call()):
            if self.target is None:
                self.target = imm
            else:
                self.target.merge(imm)

    @property
    def mnemonic(self):
        return (self.opcode or '').lower().split()[-1] if self.opcode else ''

    def is_call(self):
        return self.info.is_call(self)

    def is_jump(self):
        return self.info.is_jump(self)

    def is_branch(self):
        return self.is_jump() and not self.is_unconditional_jump() and not self.is_sink()

    def is_direct_jump(self):
        return self.is_jump() and self.info.direct_target(self) is not None

    def is_sink(self):
        return self.info.is_sink(self)

    def is_unconditional_jump(self):
        return self.info.is_unconditional_jump(self)

    def __str__(self):
        return f'{self.address}: {self.body}'


@dataclass
class BasicBlock:
    key: object
    instructions: list = field(default_factory=list)
    jump_edge: object = None
    no_jump_edge: object = None
    unresolved_jump: bool = False
    table_edges: tuple = ()

    def add_instruction(self, instruction):
        self.instructions.append(instruction)

    def add_jump_edge(self, block):
        self.jump_edge = block.key if isinstance(block, BasicBlock) else block

    def add_no_jump_edge(self, block):
        self.no_jump_edge = block.key if isinstance(block, BasicBlock) else block

    def get_label(self):
        label = r'\l'.join(escape(inst.text) for inst in self.instructions) + r'\l'
        if self.table_edges:
            label += '|{<s1>Switch}'
        elif self.jump_edge is not None or self.unresolved_jump:
            label += '|{<s0>No Jump|<s1>Jump}' if self.no_jump_edge is not None else '|{<s1>Jump}'
        return '{' + label + '}'

    def __str__(self):
        return '\n'.join(inst.text for inst in self.instructions)


@dataclass
class Function:
    name: str
    instructions: list
    blocks: dict = field(default_factory=dict)
    source: str = ''
    jump_tables: list = field(default_factory=list)

    @property
    def entry(self):
        return self.instructions[0].address.abs if self.instructions else None


@dataclass(frozen=True)
class JumpTable:
    jump_address: int
    table_address: int
    entry_size: int
    kind: str
    targets: tuple


@dataclass
class Program:
    functions: dict = field(default_factory=dict)
    diagnostics: list = field(default_factory=list)


@dataclass(frozen=True)
class CallSite:
    caller: str
    callee: str
    address: int
    kind: str
    external: bool


def escape(text):
    text = text.replace('\\', r'\\')
    for char in '<>|{}':
        text = text.replace(char, '\\' + char)
    return text.replace('\t', ' ').replace('\n', r'\l')
