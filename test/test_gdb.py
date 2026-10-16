"""
Test cases to test GDB integration.
"""
import subprocess
import os
import re
from pathlib import Path

import graphviz
import pytest


@pytest.fixture
def hello_binary(tmp_path):
    source = Path(__file__).parent / 'fixtures/simple_program/hello.c'
    binary = tmp_path / 'hello'
    subprocess.run(['gcc', '-g', str(source), '-o', str(binary)], check=True)
    return binary


def test_savecfg_help():
    result = execute_gdb_command('help savecfg')
    assert 'Save an assembly control-flow graph (CFG)' in result.stdout


def test_viewcfg_help():
    result = execute_gdb_command('help viewcfg')
    assert 'Draw an assembly control-flow graph (CFG)' in result.stdout


def test_help_set():
    result = execute_gdb_command('help set')
    assert 'set skipcalls -- Set whether savecfg and viewcfg commands will skip function' in result.stdout


def test_help_set_skipcalls():
    result = execute_gdb_command('help set skipcalls')
    assert 'Set whether savecfg and viewcfg commands will skip function' in result.stdout


def test_help_show_skipcalls():
    result = execute_gdb_command('help show skipcalls')
    assert 'Set whether savecfg and viewcfg commands will skip function' in result.stdout


def test_show_skipcalls():
    result = execute_gdb_command('show skipcalls')
    assert 'Commands savecfg and viewcfg will' in result.stdout


def test_skipcalls_inital_value():
    result = execute_gdb_command('show skipcalls')
    assert parse_option_value(result.stdout) == 'off'


def test_change_skipcalls_value():
    result = execute_gdb_command('set skipcalls')
    assert parse_option_value(result.stdout) == 'on'


def test_savecfg(tmp_path, monkeypatch, hello_binary):
    monkeypatch.chdir(tmp_path)
    result = execute_gdb_commands(
        ['set confirm off', 'set breakpoint pending on',
         f'file {hello_binary}', 'b main',
         'run', 'savecfg']
    )
    assert os.path.isfile('main.pdf'), result.stdout
    assert 'Saved CFG to a file main.pdf' in result.stdout, result.stdout


def test_viewcfg(hello_binary):
    stdout = ''
    try:
        result = execute_gdb_commands(
            ['set confirm off', 'set breakpoint pending on',
             f'file {hello_binary}', 'b main',
             'run', 'viewcfg']
        )
        stdout = result.stdout
    except subprocess.TimeoutExpired as ex:
        stdout = str(ex.stdout)
    viewcfg_pattern = re.compile(r'Opening a file (.*) with default viewer')
    result = viewcfg_pattern.search(stdout)

    assert result is not None, stdout

    temporary_filename = result.group(1)

    assert os.path.isfile(temporary_filename), temporary_filename
    assert 'digraph main' in Path(temporary_filename).read_text()
    Path(temporary_filename).unlink()


def execute_gdb_command(command):
    return execute_gdb_commands([command])


def execute_gdb_commands(commands):
    project_root_path = Path(__file__).resolve().parents[1]
    environment = os.environ.copy()
    environment['PYTHONPATH'] = os.pathsep.join([
        str(project_root_path / 'src'), str(Path(graphviz.__file__).resolve().parents[1])])
    gdb_script_path = f'{project_root_path}/src/gdb_asm2cfg.py'
    gdb_command = ['gdb', '-q', '-nx', '--batch', '-ex', f'source {gdb_script_path}',
                   '-ex', 'python import graphviz.backend; graphviz.backend.view = lambda path: None']
    for command in commands:
        gdb_command.append('-ex')
        gdb_command.append(command)
    gdb_command.append('-ex')
    gdb_command.append('q')
    result = subprocess.run(
        gdb_command, stdout=subprocess.PIPE, stdin=None,
        stderr=subprocess.STDOUT, timeout=10, check=True, universal_newlines=True, env=environment,
    )
    return result


def parse_option_value(gdb_output):
    output_pattern = re.compile(r'blocks: (on|off)')
    result = output_pattern.search(gdb_output)
    if result:
        return result.group(1)
    return result
