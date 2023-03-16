# TMS320C28x Instruction Set Architecture

TMS implementation in SimNML for the GLISS2 ISS generator.

This GLISS ISA supports TMS320C28x, 32-bits architecture, with both 16-bit and 32-bit instructions.

You must use [our fork of GLISS2](https://github.com/jordr/gliss2) for some critical fixes.

## Installation

GLISS2 must be available as a sibling directory:

```sh
cd ..
hg clone https://wwwwsecu.irit.fr/hg/TRACES/gliss2/trunk gliss2
cd gliss2
make
cd ../tms
```

Then, you have just to build ISS, disassembler and libraries with:

```sh
make
```

or

```sh
make WITH_DYNLIB=1
```

to enable `-fPIC`.

## Disassembler Use

You can find the disassembler in `disasm/tms-disasm` and run it as such

```sh
disasm/tms-disasm <binaryfile>.elf
```

There is only one mode, `tms`, so you don't need to specify `-m`. You can test this repository with

```sh
make test_disasm
```


## Implementation Status

TODO

<!-- 172 instructions, 70 fully implemented, 0 only interface

Notation:
* [ ] -- not implemented
* [I] -- ony interface implemented
* [X] -- fully implemented -->
