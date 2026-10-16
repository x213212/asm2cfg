"""Read immutable bytes at linked virtual addresses, without running the binary."""

import re
import struct
from dataclasses import dataclass
from pathlib import Path


@dataclass
class MemoryImage:
    regions: list
    bits: int = 64

    def read(self, address, size):
        for start, data in self.regions:
            offset = address - start
            if 0 <= offset and offset + size <= len(data):
                return data[offset:offset + size]
        raise ValueError(f'No immutable table bytes at 0x{address:x} ({size} bytes requested)')

    @classmethod
    def from_elf(cls, path):
        data = Path(path).read_bytes()
        if len(data) < 64 or data[:4] != b'\x7fELF' or data[5] != 1:
            raise ValueError('Jump-table binary input must be a little-endian ELF executable/shared object')
        bits = {1: 32, 2: 64}.get(data[4])
        if bits is None or int.from_bytes(data[16:18], 'little') not in (2, 3):
            raise ValueError('Provide a linked ELF executable/shared object, not a relocatable object')
        machine = int.from_bytes(data[18:20], 'little')
        if machine not in (3, 62):
            raise ValueError('Binary jump-table recovery currently supports x86 ELF only')
        if bits == 64:
            offset = struct.unpack_from('<Q', data, 32)[0]
            entry_size, count = struct.unpack_from('<HH', data, 54)
            layout = '<IIQQQQQQ'
        else:
            offset = struct.unpack_from('<I', data, 28)[0]
            entry_size, count = struct.unpack_from('<HH', data, 42)
            layout = '<IIIIIIII'
        expected = struct.calcsize(layout)
        if entry_size < expected or offset + count * entry_size > len(data):
            raise ValueError('Invalid/truncated ELF program-header table')
        regions = []
        for number in range(count):
            fields = struct.unpack_from(layout, data, offset + number * entry_size)
            if bits == 64:
                kind, flags, file_offset, address, _, size, _, _ = fields
            else:
                kind, file_offset, address, _, size, _, flags, _ = fields
            if file_offset + size > len(data):
                raise ValueError('Invalid/truncated ELF load segment')
            if kind == 1 and not flags & 2:
                regions.append((address, data[file_offset:file_offset + size]))
        return cls(regions, bits)

    @classmethod
    def from_objdump(cls, lines):
        """Read `objdump -s` output; only conventional immutable sections are used."""
        regions, current, start, buffer = [], False, None, bytearray()
        for line in lines:
            section = re.match(r'Contents of section (.+):', line)
            if section:
                if start is not None:
                    regions.append((start, bytes(buffer)))
                start, buffer = None, bytearray()
                current = section[1].startswith(('.rodata', '.text', '.rdata'))
                continue
            if not current:
                continue
            match = re.match(r'^\s*([0-9a-fA-F]+)\s+((?:[0-9a-fA-F]{8}(?: |$)){1,4}|[0-9a-fA-F]{2,6}(?: |$))', line)
            if not match:
                continue
            address = int(match[1], 16)
            content = bytes.fromhex(match[2])
            if start is None:
                start = address
            elif address != start + len(buffer):
                regions.append((start, bytes(buffer)))
                start, buffer = address, bytearray()
            buffer.extend(content)
        if start is not None:
            regions.append((start, bytes(buffer)))
        if not regions:
            raise ValueError('No immutable section bytes found; use objdump -s -j .rodata program')
        return cls(regions)
