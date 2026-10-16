"""Build per-function CFGs and collect observed interprocedural call sites."""

from .model import Address, BasicBlock, CallSite, Instruction


def build_cfg(function, skip_calls=False):
    instructions = function.instructions
    if not instructions:
        return {}
    addresses = {inst.address.abs for inst in instructions}
    start = function.entry
    destinations = set()
    tables = {table.jump_address: table for table in function.jump_tables}
    for table in function.jump_tables:
        destinations.update(table.targets)
    for inst in instructions:
        if inst.address.offset is None:
            inst.address.offset = inst.address.abs - start
        if not (inst.is_jump() or inst.is_call()):
            continue
        direct = inst.info.direct_target(inst)
        if direct is not None:
            if inst.target is None:
                inst.target = Address(direct)
            inst.target.abs = direct
            if direct in addresses:
                inst.target.base = function.name
                inst.target.offset = direct - start
                if inst.is_jump() and not inst.is_sink():
                    destinations.add(direct)

    blocks = {}
    current = previous = None
    for inst in instructions:
        if current is None or (inst.address.abs in destinations and current.instructions):
            before = current
            current = BasicBlock(inst.address.abs)
            blocks[current.key] = current
            if before is not None:
                before.add_no_jump_edge(current)
            if previous is not None:
                previous.add_no_jump_edge(current)
                previous = None
        current.add_instruction(inst)
        if inst.is_sink():
            current = previous = None
        elif inst.is_jump():
            direct = inst.info.direct_target(inst)
            if inst.address.abs in tables:
                current.table_edges = tuple(dict.fromkeys(tables[inst.address.abs].targets))
            elif direct is None:
                current.unresolved_jump = True
            else:
                current.add_jump_edge(direct)
            previous = None if inst.is_unconditional_jump() else current
            current = None
        elif inst.is_call() and not skip_calls:
            # A call has a continuation in this CFG. Its callee lives in the call graph.
            previous, current = current, None
    if previous is not None:
        end = BasicBlock('end_of_function')
        end.add_instruction(Instruction('', 'end of function', 0, None, None, [], None, None, instructions[0].info))
        previous.add_no_jump_edge(end)
        blocks[end.key] = end
    function.blocks = blocks
    return blocks


def adjacency(blocks):
    """Only edges to actual blocks participate in intraprocedural analysis."""
    return {key: tuple(dict.fromkeys(dst for dst in (block.jump_edge, block.no_jump_edge, *block.table_edges)
                                     if dst is not None and dst in blocks)) for key, block in blocks.items()}


def call_sites(program):
    by_address = {}
    for function in program.functions.values():
        by_address.setdefault(function.entry, []).append(function.name)
    sites = []
    for function in program.functions.values():
        local = {inst.address.abs for inst in function.instructions}
        for inst in function.instructions:
            if not (inst.is_call() or (inst.is_unconditional_jump() and not inst.is_sink())):
                continue
            direct = inst.info.direct_target(inst)
            if not inst.is_call() and (direct is None or direct in local):
                continue
            kind = 'call' if inst.is_call() else 'tail-call'
            callee = None
            if direct is not None:
                matches = by_address.get(direct, [])
                if len(matches) == 1:
                    callee = matches[0]
                elif inst.target is not None and inst.target.base is not None:
                    callee = inst.target.base if not inst.target.offset else str(inst.target)
                else:
                    callee = f'0x{direct:x}'
            else:
                # Do not turn a comment describing a pointer slot into a proven callee.
                callee = f'<indirect at {function.name}:0x{inst.address.abs:x}>'
                kind = 'indirect-call'
            sites.append(CallSite(function.name, callee, inst.address.abs, kind, callee not in program.functions))
    return sites
