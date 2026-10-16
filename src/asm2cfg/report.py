"""JSON and standalone HTML reports, with explicit unknown control transfers."""

import base64
import html

from .analysis import analyze_function, cycle_regions
from .cfg import call_sites


def html_report(graphs, program, timeout=30):
    """Embed SVG images in one offline page. Assembly and names remain escaped text."""
    from .render import graph_bytes

    sections = []
    for name, graph in graphs:
        encoded = base64.b64encode(graph_bytes(graph, 'svg', timeout)).decode('ascii')
        is_call_graph = graph.graph_attr.get('id') == 'asm2cfg-call-graph'
        title = '呼叫圖 / Call graph' if is_call_graph else name
        explanation = ''
        if not is_call_graph and graph.name in program.functions:
            regions = cycle_regions(program.functions[graph.name])
            title += f' — {len(regions)} 個迴圈區域' if regions else ' — 沒有找到迴圈'
            if regions:
                items = []
                for region in regions:
                    header = '、'.join(f'0x{key:x}' for key in region['headers']) or '沒有已知的單一入口'
                    edges = '；'.join(f'0x{source:x} → 0x{target:x}' for source, target in region['back_edges'])
                    detail = f'入口 {header} · {len(region["blocks"])} 個區塊'
                    if edges:
                        detail += ' · 回邊 ' + edges
                    items.append(f'<li><strong>迴圈 {region["id"]}</strong>：{html.escape(detail)}</li>')
                explanation = '<ul class="loops">' + ''.join(items) + '</ul>'
            else:
                explanation = '<p class="loop-note">此函式的已知 CFG 沒有迴圈；switch 的多個分支本身不代表迴圈。</p>'
        sections.append(f'<details open><summary>{html.escape(title)}</summary>{explanation}'
                        f'<div class="graph"><img alt="{html.escape(title, quote=True)}" '
                        f'src="data:image/svg+xml;base64,{encoded}"></div></details>')
    diagnostics = ''.join(f'<li>{html.escape(message)}</li>' for message in program.diagnostics)
    calls = call_sites(program)
    return '''<!doctype html>
<html lang="zh-Hant"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>asm2cfg 分析報告</title><style>
body{font-family:system-ui,sans-serif;background:#f5f5f2;color:#292b30;margin:0;padding:24px}
main{max-width:1600px;margin:auto}h1{font-size:26px}p,li{line-height:1.7}p{color:#61656c}
details{background:white;border:1px solid #d5d7db;border-radius:6px;margin:16px 0}
summary{padding:14px;cursor:pointer;font-weight:600}.graph{overflow:auto;max-height:75vh;padding:16px}
img{max-width:none}code{font-family:monospace}a{color:#285b9a}
.loops{padding:12px 16px 12px 40px;background:#edf5ed;margin:0;color:#174523}
.loop-note{padding:0 16px}.graph{background:white}
</style><main><h1>asm2cfg 分析報告</h1>''' + (
        f'<p>{len(program.functions)} 個函式 · {len(calls)} 個呼叫／尾端轉移位置</p>'
        '<p>同色且標有 L1、L2 的區塊屬於同一迴圈區域。紅色粗箭頭標出回邊與回跳位址。'
        '一個區域可能包含巢狀迴圈。啟用支配標示時，藍色點線表示直接支配關係。</p>'
        '<p>呼叫圖只涵蓋輸入中可辨識的呼叫。間接目標保留為未知；圖中的邊不代表已證明可執行的路徑。'
        '間接跳躍未解析時，灰色區塊仍可能經由未知邊抵達。</p>'
        + ('<ul>' + diagnostics + '</ul>' if diagnostics else '') + ''.join(sections) + '</main></html>')


def program_report(program):
    functions = []
    for function in program.functions.values():
        analysis = analyze_function(function)
        blocks = []
        for block in function.blocks.values():
            blocks.append({'address': block.key, 'reachable': block.key in analysis.reachable,
                           'jump': block.jump_edge, 'fallthrough': block.no_jump_edge,
                           'unresolved_jump': block.unresolved_jump,
                           'switch_targets': list(block.table_edges),
                           'instructions': [{'address': inst.address.abs if inst.address else None,
                                             'line': inst.lineno, 'text': inst.text,
                                             'annotations': inst.annotations} for inst in block.instructions]})
        functions.append({'name': function.name, 'entry': function.entry, 'blocks': blocks,
                          'indirect_jumps_resolved': analysis.complete,
                          'dominator_scope': 'known CFG edges only',
                          'jump_tables': [vars(table) for table in function.jump_tables],
                          'cycles': [list(component) for component in analysis.cycles],
                          'immediate_dominators': [{'block': node, 'dominator': parent}
                                                   for node, parent in analysis.immediate_dominators.items()],
                          'back_edges': [list(edge) for edge in sorted(analysis.back_edges, key=str)]})
    return {'schema_version': 1, 'functions': functions,
            'calls': [vars(site) for site in call_sites(program)], 'diagnostics': program.diagnostics,
            'scope': 'Observed direct calls and branches in input; indirect targets are unresolved; '
                     'CFG edges describe syntactic control flow, not proven executable paths.'}
