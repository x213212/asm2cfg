# asm2cfg

Assembly control-flow and call-graph visualization for x86, ARM and RISC-V.
This fork preserves its RISC-V support, Tarjan cycle coloring and side-by-side
SVG comparison, and separates parsing, graph analysis and rendering.

## 快速使用

需要 Python 3.10 以上，以及 Graphviz 的 `dot` 執行檔。安裝本 fork：

```sh
python3 -m pip install .
asm2cfg input.asm --target riscv --dominators --format html -o output
```

開啟 `output/report.html` 即可查看繁體中文說明、呼叫圖與各函式 CFG。
報告是單一離線 HTML，不需要伺服器或外部 JavaScript。

- **CFG**：每個函式內的基本區塊、跳躍與接續執行關係。
- **Call graph**：函式之間的呼叫，標出呼叫指令位址。
- **SCC 底色**：Tarjan 找到的循環區域，包含單一節點自迴圈與兩節點迴圈。
- **Dominator**：從入口到某區塊的所有已知 CFG 路徑，都必經的區塊；
  `--dominators` 顯示最近的支配者（immediate dominator）。
- **紅色粗回邊**：標示 L1、L2 迴圈編號，以及來源與目標位址。
- **藍色點線**：直接支配關係，與實際 CFG 邊分開標示。

SCC 與支配關係使用不同演算法。支配分析僅適用於從函式入口沿已知邊
可抵達的區塊；間接跳躍的目標未解析時，圖形會明確標示這項限制。

## CLI examples

Generate an objdump input without executing the binary:

```sh
objdump -d program > program.asm
asm2cfg program.asm --target x86 --graph both --dominators -o output
```

Supported inputs are GDB disassembly and objdump disassembly with function
headers and instruction addresses. Raw source assembly without addresses is
outside the parser's current scope. Source annotations from `objdump -S` are
attached to real instructions; they are never assigned invented addresses.

RISC-V remains the default target for this fork. Specify `--target x86` or
`--target arm` explicitly for other architectures.

```sh
# One input containing several functions:
asm2cfg program.asm --target riscv --graph calls --format svg -o output

# Combine distinct functions dumped into separate files:
asm2cfg main.asm helper.asm --target riscv --graph both -o output

# Full machine-readable analysis (does not invoke dot):
asm2cfg program.asm --target riscv --format json -o output

# CFG for one selected function; calls remain in the call graph:
asm2cfg program.asm --target riscv --function main --skip-calls -o output

# Export DOT without waiting for Graphviz layout:
asm2cfg program.asm --target riscv --format dot -o output
```

## Jump tables / switch 跳表

For common guarded x86 GCC/Clang-style switch sequences, provide the matching
linked ELF so the analyzer can read the actual immutable table bytes:

```sh
objdump -d program > program.asm
asm2cfg program.asm --target x86 --binary program --dominators --format html -o output
```

Alternatively, supply an objdump section dump:

```sh
objdump -s -j .rodata program > rodata.txt
asm2cfg program.asm --target x86 --table-data rodata.txt --format json -o output
```

Supported patterns include signed 32-bit table-relative offsets and absolute
pointer tables, using AT&T or Intel syntax. Recovery requires a dominating
unsigned upper-bound check and a traceable dispatch sequence. The table is
limited to 4,096 entries, and every entry must land on an actual instruction
in the same function. Case edges are added to the CFG and dominance is
rechecked after recovery. JSON retains every table index, including duplicate
destinations. ELF reads use linked virtual addresses and do not execute or
modify the binary; encoded instructions are checked against the binary first.

只提供反組譯而沒有表格資料時，間接跳躍會保留為未知。缺少上限檢查、
表格位於可寫區段、資料截斷、目標不在指令邊界，或無法辨識的序列，也會
保留未知。暫不處理未套用重定位的 object、執行期修改的表格、ASLR 後的
GDB 位址、RISC-V／ARM 跳表及任意計算式間接跳躍。

Formats: `svg` (default), `pdf`, `png`, `dot`, `json`, `html`.
`--graph cfg|calls|both` defaults to `both`. JSON always contains the complete
parsed analysis; `--function` selects visual CFG output only.
`--render-timeout 30` bounds each Graphviz subprocess.
`--no-loops` disables cycle coloring. `--view` explicitly opens an external viewer.
Graphs default to left-to-right layout with increased spacing. Use
`--direction vertical` for top-to-bottom layout. Full assembly remains visible;
loop blocks retain strong colors and show L1/L2 identifiers and entry labels.

Output filenames are derived safely from function names. Functions with
colliding sanitized names receive separate filenames. Duplicate function names
across input files are rejected; render separate versions into separate output
directories and compare their SVGs.

## SVG comparison

Open [compare.html](compare.html) directly in a browser. Select or drop files
independently on each side. Each pane supports multiple files, selection, zoom
and fit-to-width; proportional synchronized scrolling can be disabled.
The page works offline, uses no CDN, and does not upload files.
SVGs are displayed as images rather than active embedded documents.

## GDB extension

After installing this checkout, source the installed `gdb_asm2cfg.py` script
from GDB. For development, make the source package and its Graphviz Python
dependency available to GDB's Python interpreter:

```sh
PYTHONPATH=src gdb -ex 'source src/gdb_asm2cfg.py' program
```

Commands: `viewcfg`, `savecfg`, `set skipcalls on|off`.
Both commands detect the selected frame's architecture (x86, ARM or RISC-V).
`savecfg` writes a PDF. `viewcfg` creates a DOT file and opens the system viewer.

## Architecture

| Module | Responsibility |
| --- | --- |
| `model.py` | Instructions, addresses, functions, blocks and call sites |
| `targets.py` | Architecture-specific call, branch and return semantics |
| `parser.py` | GDB/objdump parsing, multiple functions and source annotations |
| `cfg.py` | Per-function CFG construction and interprocedural call collection |
| `memory.py` | Read immutable bytes from linked x86 ELF or objdump section dumps |
| `jumptables.py` | Guarded switch-table recovery with bounds and target validation |
| `analysis.py` | Iterative Tarjan SCC and immediate dominators |
| `render.py` | Graphviz CFG/call graph styling and bounded rendering |
| `report.py` | JSON and standalone Traditional Chinese HTML reports |
| `command_line.py` | Input/output options and orchestration |
| `asm2cfg.py` | Small public API used by existing single-function callers |

Algorithms keep state local to each analysis. Tarjan is O(V + E) and uses an
explicit stack, so deep graphs do not hit Python's recursion limit. Dominators
use a reverse-postorder fixed point. Neither algorithm enumerates execution
paths. Graphviz layout can still be expensive on large graphs; DOT and JSON
exports bypass layout.

## Scope and limitations

- Direct calls are matched against function entries present in the input.
  External callees remain visible without inventing their bodies.
- Register-indirect calls remain unresolved, even if an objdump comment names
  a pointer slot. Direct transfers outside a function are labeled tail calls;
  custom calling conventions can require additional interpretation.
- RISC-V classification follows standard ra/x1 and alternate x5 link-register
  conventions, including compressed control transfers.
- Jump-table recovery covers the guarded x86 patterns documented above.
  Arbitrary indirect-target resolution, exception edges and proof of path
  feasibility are not implemented. Return continuations assume calls can return.
- Gray blocks are unreachable through known CFG edges. Unknown indirect edges
  can make additional blocks reachable at runtime.
- This tool visualizes supplied disassembly. Binary insertion, instruction
  scheduling, address relocation and executable regeneration require a
  separate rewriting backend.

## Development

```sh
python3 -m venv .venv
.venv/bin/python -m pip install -e '.[test]'
.venv/bin/python -m pytest test/
.venv/bin/python -m flake8 src test
```

Graphviz, GDB and GCC are needed for rendering/integration tests. GDB tests
compile their own small program and suppress external viewers. They require
permission to trace that test process.

Regression coverage includes RISC-V calls/returns, source annotations, unknown
indirect targets, self loops, two-node loops, recursion, dominance diamonds,
10,000-node graphs, and 100 seeded graph comparisons against NetworkX.
Jump-table tests include real PIE/non-PIE compilation, both disassembly
syntaxes, malformed tables, binary/disassembly mismatches, and GDB execution
checks comparing each recovered destination with the actual indirect jump.
The original jump-table regression now passes as a normal test.

Original project: [Kazhuu/asm2cfg](https://github.com/Kazhuu/asm2cfg).
Related request: [issue #24 — Mark dominator edges in CFG](https://github.com/Kazhuu/asm2cfg/issues/24).
RISC-V semantics: [base control transfers](https://docs.riscv.org/reference/isa/v20260120/unpriv/rv32.html)
and [compressed instructions](https://docs.riscv.org/reference/isa/v20260120/unpriv/c-st-ext.html).
License: [MIT](LICENSE); original attribution is retained.
