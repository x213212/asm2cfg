"""
Let this module to be executed from the command line with python -m src.asm2cfg
from root of the project
"""

from . import command_line

if __name__ == '__main__':
    raise SystemExit(command_line.main())
