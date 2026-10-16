"""Iterative graph algorithms. No execution paths are enumerated."""

from dataclasses import dataclass

from .cfg import adjacency


def strongly_connected_components(graph):
    """Tarjan SCC in O(V + E) time, using explicit DFS frames instead of recursion."""
    index, low, active, stack, components = {}, {}, set(), [], []
    for root in graph:
        if root in index:
            continue
        index[root] = low[root] = len(index)
        stack.append(root)
        active.add(root)
        frames = [(root, iter(graph[root]))]
        while frames:
            node, successors = frames[-1]
            child = next(successors, None)
            if child is not None:
                if child not in graph:
                    continue
                if child not in index:
                    index[child] = low[child] = len(index)
                    stack.append(child)
                    active.add(child)
                    frames.append((child, iter(graph[child])))
                elif child in active:
                    low[node] = min(low[node], index[child])
                continue
            frames.pop()
            if low[node] == index[node]:
                component = []
                while True:
                    member = stack.pop()
                    active.remove(member)
                    component.append(member)
                    if member == node:
                        break
                components.append(tuple(component))
            if frames:
                parent = frames[-1][0]
                low[parent] = min(low[parent], low[node])
    return components


def reverse_postorder(graph, entry):
    if entry not in graph:
        return []
    visited, postorder = {entry}, []
    frames = [(entry, iter(graph[entry]))]
    while frames:
        node, successors = frames[-1]
        child = next(successors, None)
        if child is None:
            frames.pop()
            postorder.append(node)
        elif child in graph and child not in visited:
            visited.add(child)
            frames.append((child, iter(graph[child])))
    return list(reversed(postorder))


def immediate_dominators(graph, entry):
    """Cooper-style fixed point in reverse postorder; unreachable nodes are excluded."""
    order = reverse_postorder(graph, entry)
    if not order:
        return {}
    rank = {node: position for position, node in enumerate(order)}
    predecessors = {node: [] for node in order}
    for node in order:
        for child in graph[node]:
            if child in predecessors:
                predecessors[child].append(node)
    dominators = {entry: entry}

    def intersect(left, right):
        while left != right:
            while rank[left] > rank[right]:
                left = dominators[left]
            while rank[right] > rank[left]:
                right = dominators[right]
        return left

    changed = True
    while changed:
        changed = False
        for node in order[1:]:
            parents = [parent for parent in predecessors[node] if parent in dominators]
            if not parents:
                continue
            candidate = parents[0]
            for parent in parents[1:]:
                candidate = intersect(candidate, parent)
            if dominators.get(node) != candidate:
                dominators[node] = candidate
                changed = True
    return dominators


def _dominance_intervals(dominators, entry):
    children = {node: [] for node in dominators}
    for node, parent in dominators.items():
        if node != parent:
            children[parent].append(node)
    intervals, starts, counter = {}, {}, 0
    frames = [(entry, False)] if entry in children else []
    while frames:
        node, exiting = frames.pop()
        if exiting:
            intervals[node] = (starts[node], counter)
            counter += 1
        else:
            starts[node] = counter
            counter += 1
            frames.append((node, True))
            frames.extend((child, False) for child in reversed(children[node]))
    return intervals


@dataclass
class GraphAnalysis:
    reachable: set
    immediate_dominators: dict
    cycles: list
    back_edges: set
    complete: bool


def analyze_function(function):
    graph = adjacency(function.blocks)
    dominators = immediate_dominators(graph, function.entry)
    intervals = _dominance_intervals(dominators, function.entry)
    cycles = [component for component in strongly_connected_components(graph)
              if len(component) > 1 or component[0] in graph[component[0]]]
    back_edges = set()
    for source, targets in graph.items():
        for target in targets:
            if source in intervals and target in intervals:
                begin, end = intervals[target]
                if begin <= intervals[source][0] <= end:
                    back_edges.add((source, target))
    complete = not any(block.unresolved_jump for block in function.blocks.values())
    return GraphAnalysis(set(dominators), dominators, cycles, back_edges, complete)


def cycle_regions(function, analysis=None):
    """Stable presentation IDs for cyclic SCCs; a region may contain nested loops."""
    analysis = analysis or analyze_function(function)
    positions = {key: position for position, key in enumerate(function.blocks)}
    components = sorted(analysis.cycles, key=lambda members: min(positions[key] for key in members))
    regions = []
    for number, component in enumerate(components, 1):
        members = set(component)
        edges = sorted(((source, target) for source, target in analysis.back_edges
                        if source in members and target in members), key=lambda edge: positions[edge[0]])
        regions.append({'id': f'L{number}', 'blocks': sorted(members, key=positions.get),
                        'headers': list(dict.fromkeys(target for _, target in edges)), 'back_edges': edges})
    return regions
