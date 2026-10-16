"""Graphviz presentation; accepts models without mutating their analysis state."""

import re
import subprocess
import tempfile
from pathlib import Path

from graphviz import Digraph

from .analysis import analyze_function, cycle_regions, strongly_connected_components
from .cfg import call_sites
from .model import Function

LOOP_COLORS = ('#008000', '#165ac4', '#b12b38', '#7540a8', '#007b75', '#926000')


def safe_filename(name):
    name = re.sub(r'[^\w.-]+', '_', name).strip('.')
    return name[:120] or 'graph'


def cfg_graph(function, loops=True, dominators=False, analysis=None, direction='horizontal'):
    analysis = analysis or analyze_function(function)
    graph = Digraph(name=function.name, comment=function.name)
    label = function.name
    if not analysis.complete:
        label += '\nIndirect jump targets unresolved; dominators use known edges only'
    graph.attr('graph', label=label, labelloc='t', bgcolor='white',
               rankdir='LR' if direction == 'horizontal' else 'TB', nodesep='0.65', ranksep='1.1', pad='0.25')
    graph.attr('node', fontname='monospace', fontsize='11', margin='0.18,0.13')
    graph.attr('edge', fontname='sans-serif', fontsize='10', arrowsize='0.85')
    regions = cycle_regions(function, analysis)
    membership = {key: position for position, region in enumerate(regions) for key in region['blocks']}
    for key, block in function.blocks.items():
        attributes = {'shape': 'record', 'label': block.get_label()}
        if loops and key in membership:
            region = regions[membership[key]]
            prefix = f'迴圈 {region["id"]}' + (' · 入口' if key in region['headers'] else '')
            attributes['label'] = '{' + prefix + r'\l' + attributes['label'][1:]
            attributes.update(style='filled', fillcolor=LOOP_COLORS[membership[key] % len(LOOP_COLORS)],
                              fontcolor='white', color='#174523', penwidth='2')
        if key not in analysis.reachable:
            attributes.update(color='#888888', fontcolor='#777777', style='dashed',
                              tooltip='Not reachable via known CFG edges')
        graph.node(str(key), **attributes)
    external = set()
    for key, block in function.blocks.items():
        for target, port, label in ((block.jump_edge, ':s1', 'jump'), (block.no_jump_edge, '', '')):
            if target is None:
                continue
            if not port and (block.jump_edge is not None or block.unresolved_jump):
                port, label = ':s0', 'fallthrough'
            attributes = {'label': label} if label else {}
            if (key, target) in analysis.back_edges:
                region = regions[membership[key]]
                attributes.update(color='#c22430', fontcolor='#a51d27', penwidth='3',
                                  label=f'{region["id"]} 回邊\n0x{key:x} → 0x{target:x}',
                                  constraint='false', tooltip='Back edge: target dominates source')
            elif dominators and analysis.immediate_dominators.get(target) == key:
                attributes.update(color='#285b9a', penwidth='2', tooltip='Immediate dominator edge')
            if target not in function.blocks:
                external.add(target)
            graph.edge(str(key) + port, str(target), **attributes)
        if block.unresolved_jump:
            unknown = f'unknown_{key}'
            graph.node(unknown, label='unresolved indirect jump', shape='ellipse', style='dashed')
            graph.edge(str(key) + ':s1', unknown, style='dashed')
        if block.table_edges:
            table = next(table for table in function.jump_tables
                         if table.jump_address == block.instructions[-1].address.abs)
            cases = {target: [] for target in block.table_edges}
            for index, target in enumerate(table.targets):
                cases[target].append(index)
            for target, indices in cases.items():
                label = ', '.join(str(index) for index in indices[:8])
                if len(indices) > 8:
                    label += f', … (+{len(indices) - 8})'
                attributes = {'label': 'index ' + label,
                              'tooltip': f'{table.kind} jump table at 0x{table.table_address:x}'}
                if (key, target) in analysis.back_edges:
                    region = regions[membership[key]]
                    attributes.update(color='#c22430', fontcolor='#a51d27', penwidth='3',
                                      label=attributes['label'] + f' · {region["id"]} 回邊', constraint='false')
                graph.edge(str(key) + ':s1', str(target), **attributes)
    for target in external:
        label = f'outside function: 0x{target:x}' if isinstance(target, int) else str(target)
        graph.node(str(target), label=label, shape='ellipse', style='dashed')
    if dominators:
        for node, parent in analysis.immediate_dominators.items():
            if node == parent:
                continue
            block = function.blocks[parent]
            if node not in (block.jump_edge, block.no_jump_edge):
                graph.edge(str(parent), str(node), color='#285b9a', style='dotted',
                           constraint='false', label='idom', tooltip='Dominator relation, not a CFG edge')
    return graph


def call_graph(program, direction='horizontal'):
    graph = Digraph(name='calls', comment='Observed calls and direct tail transfers')
    graph.graph_attr['id'] = 'asm2cfg-call-graph'
    graph.attr('graph', rankdir='LR' if direction == 'horizontal' else 'TB', label='Call graph',
               labelloc='t', nodesep='0.65', ranksep='1.1', pad='0.25')
    sites = call_sites(program)
    adjacency = {name: set() for name in program.functions}
    for site in sites:
        if not site.external:
            adjacency[site.caller].add(site.callee)
    recursive = {name for component in strongly_connected_components(adjacency)
                 if len(component) > 1 or component[0] in adjacency[component[0]] for name in component}
    names = list(program.functions) + list(dict.fromkeys(site.callee for site in sites if site.external))
    ids = {name: f'f{index}' for index, name in enumerate(names)}
    for name in names:
        attributes = {'label': name, 'shape': 'box'}
        if name not in program.functions:
            attributes.update(style='dashed', color='#888888')
        elif name in recursive:
            attributes.update(style='filled', fillcolor=LOOP_COLORS[0], fontcolor='white')
        graph.node(ids[name], **attributes)
    grouped = {}
    for site in sites:
        grouped.setdefault((site.caller, site.callee, site.kind), []).append(site.address)
    for (caller, callee, kind), addresses in grouped.items():
        preview = ', '.join(f'0x{address:x}' for address in addresses[:6])
        if len(addresses) > 6:
            preview += f', … (+{len(addresses) - 6})'
        graph.edge(ids[caller], ids[callee], label=f'{kind}: {preview}',
                   style='dashed' if kind == 'indirect-call' else 'solid')
    return graph


def graph_bytes(graph, format='svg', timeout=30):
    """Render in memory with a timeout; DOT needs no Graphviz executable."""
    if format == 'dot':
        return graph.source.encode('utf8')
    result = subprocess.run(['dot', '-T' + format], input=graph.source.encode('utf8'),
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=timeout, check=True)
    return result.stdout


def write_graph(graph, destination, format='svg', timeout=30):
    """A timed-out renderer cannot leave a partial destination file."""
    destination = Path(destination)
    data = graph_bytes(graph, format, timeout)
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_bytes(data)
    return destination


def draw_cfg(function_name, basic_blocks, view=False):
    """GDB-facing single-function rendering API."""
    instructions = [inst for block in basic_blocks.values() for inst in block.instructions if inst.address is not None]
    function = Function(function_name, instructions, basic_blocks)
    graph = cfg_graph(function)
    if view:
        with tempfile.NamedTemporaryFile(prefix=safe_filename(function_name), suffix='.gv', delete=False) as temporary:
            path = temporary.name
        Path(path).write_text(graph.source, encoding='utf8')
        print(f'Opening a file {path} with default viewer.')
        from graphviz.backend import view as open_viewer
        open_viewer(path)
        return Path(path)
    destination = write_graph(graph, safe_filename(function_name) + '.pdf', format='pdf')
    print(f'Saved CFG to a file {destination}')
    return destination
