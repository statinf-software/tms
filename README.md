# TMS???

TMS implementation in SimNML for GLISS2 ISS generator.

This GLISS ISA supports TMS???, 32???-bits architecture.

## Installation

GLISS2 must be available as a sibling directory:

```sh
cd ..
hg clone https://wwwwsecu.irit.fr/hg/TRACES/gliss2/trunk gliss2
cd gliss2
make
cd ../mips
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


## Implementation Status

172 instructions, 70 fully implemented, 0 only interface

Notation:
* [ ] -- not implemented
* [I] -- ony interface implemented
* [X] -- fully implemented
