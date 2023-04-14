# TMS320C28x Instruction Set Architecture

TMS implementation in SimNML for the GLISS2 ISS generator. [TMS320C28x CPU and Instruction Set Reference Guide](https://www.ti.com/lit/ug/spru430f/spru430f.pdf), [TMS320C28x Floating Point Unit and
Instruction Set](https://www.ti.com/lit/ug/sprueo2b/sprueo2b.pdf), and [TMS320C28x Extended Instruction Sets Technical Reference Manual](https://www.ti.com/lit/ug/spruhs1c/spruhs1c.pdf) (from ti.com).

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
make WITH_DYNLIB=
```

or

```sh
make
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

Notation:
* [ ] -- Not implemented
* [partial] -- Partially implemented (not all masks done)
* [x] -- Disasembler implemented (no actions)

Instructions used in LTS code:

- [ ] ABORTI
- [ ] ABS
- [ ] ABSF32
- [ ] ABSTC
- [ ] ADD 	[blinky]
- [partial] ADDB 	[blinky]
- [ ] ADDCL
- [ ] ADDCU
- [ ] ADDF32
- [ ] ADDL 	[blinky]
- [ ] ADDU 	[blinky]
- [ ] ADDUL
- [ ] ADRK
- [ ] AND 	[blinky]
- [ ] ANDB
- [ ] ASP 	[blinky]
- [ ] ASR
- [ ] ASR64
- [ ] ASRL
- [ ] B
- [ ] BANZ 	[blinky]
- [ ] BAR
- [ ] BF
- [ ] C27MAP
- [ ] C27OBJ
- [ ] C28ADDR
- [ ] C28MAP
- [ ] C28OBJ
- [ ] CLRC 	[blinky]
- [ ] CMP
- [ ] CMP64
- [ ] CMPB 	[blinky]
- [ ] CMPF32
- [ ] CMPL 	[blinky]
- [ ] CMPR
- [ ] CSB
- [ ] DEC
- [ ] DINT
- [ ] DIVF32
- [ ] DMAC
- [ ] DMOV
- [ ] EALLOW
- [ ] EDIS
- [ ] EINT
- [ ] EINVF32
- [ ] EISQRTF32
- [ ] ESTOP0
- [ ] ESTOP1
- [ ] F32TOI16
- [ ] F32TOI16R
- [ ] F32TOI32
- [ ] F32TOUI16
- [ ] F32TOUI16R
- [ ] F32TOUI32
- [ ] FFC
- [ ] FLIP
- [ ] FRACF32
- [ ] I16TOF32
- [ ] I32TOF32
- [ ] IACK
- [ ] IDLE
- [ ] IMACL
- [ ] IMPYAL
- [ ] IMPYL
- [ ] IMPYSL
- [ ] IMPYXUL
- [ ] IN
- [ ] INC
- [ ] INTR
- [ ] IRET
- [ ] LB
- [ ] LC
- [ ] LCR 	[blinky]
- [ ] LOOPNZ
- [ ] LOOPZ
- [ ] LPADDR
- [ ] LRET
- [ ] LRETE
- [x] LRETR 	[blinky]
- [ ] LSL
- [ ] LSL64
- [ ] LSLL
- [ ] LSR 	[blinky]
- [ ] LSR64
- [ ] LSRL
- [ ] MAC
- [ ] MACF32
- [ ] MAX
- [ ] MAXCUL
- [ ] MAXF32
- [ ] MAXL
- [ ] MIN
- [ ] MINCUL
- [ ] MINF32
- [ ] MINL
- [partial] MOV 	[blinky]
- [ ] MOV16
- [ ] MOV32
- [ ] MOVA
- [ ] MOVAD
- [ ] MOVB 	[blinky]
- [ ] MOVD32
- [ ] MOVDL
- [ ] MOVH
- [ ] MOVIZ
- [ ] MOVIZF32
- [partial] MOVL 	[blinky]
- [ ] MOVP
- [ ] MOVS
- [ ] MOVST0
- [ ] MOVU
- [ ] MOVW 	[blinky]
- [ ] MOVX
- [ ] MOVXI
- [ ] MOVZ 	[blinky]
- [ ] MPY 	[blinky]
- [ ] MPYA
- [ ] MPYB
- [ ] MPYF32
- [ ] MPYS
- [ ] MPYU
- [ ] MPYXU
- [ ] NASP
- [ ] NEG
- [ ] NEG64
- [ ] NEGF32
- [ ] NEGTC
- [x] NOP 	[blinky]
- [ ] NORM
- [ ] NOT
- [ ] OR
- [ ] ORB
- [ ] OUT
- [ ] Parallel
- [ ] POP
- [ ] PREAD
- [ ] PUSH
- [ ] PWRITE
- [ ] QMACL
- [ ] QMPYAL
- [ ] QMPYL
- [ ] QMPYSL
- [ ] QMPYUL
- [ ] QMPYXUL
- [ ] RESTORE
- [ ] ROL
- [ ] ROR
- [ ] RPT
- [ ] RPTB
- [ ] SAT
- [ ] SAT64
- [ ] SAVE
- [x] SB 	[blinky]
- [ ] SBBU
- [ ] SBF
- [ ] SBRK
- [ ] SETC 	[blinky]
- [ ] SETFLG 	[blinky]
- [ ] SFR 	[blinky]
- [ ] SPM 	[blinky]
- [ ] SQRA
- [ ] SQRS
- [ ] SUB
- [partial] SUBB 	[blinky]
- [ ] SUBBL
- [ ] SUBCU
- [ ] SUBCUL
- [ ] SUBF32
- [ ] SUBL 	[blinky]
- [ ] SUBR
- [ ] SUBRL
- [x] SUBU 	[blinky]
- [ ] SUBUL
- [ ] SWAPF
- [ ] TBIT 	[blinky]
- [ ] TCLR
- [ ] TEST
- [ ] TESTTF
- [ ] TRAP
- [ ] TSET
- [ ] UI16TOF32
- [ ] UI32TOF32
- [ ] UOUT
- [ ] XB
- [ ] XBANZ
- [ ] XCALL
- [ ] XMAC
- [ ] XMACD
- [ ] XOR
- [ ] XORB
- [ ] XPREAD
- [ ] XPWRITE
- [ ] XRET
- [ ] XRETC
- [ ] ZALR
- [ ] ZAP
- [ ] ZAPA
- [ ] ZERO
- [ ] ZEROA

Floating Point Instructions for TMS:
 - [ ] ABSF32 RaH, RbH
 - [ ] ADDF32 RaH, #16FHi, RbH
 - [ ] ADDF32 RaH, RbH, #16FHi
 - [ ] ADDF32 RaH, RbH, RcH
 - [ ] ADDF32 RdH, ReH, RfH || MOV32 mem32, RaH
 - [ ] ADDF32 RdH, ReH, RfH || MOV32 RaH, mem32
 - [ ] CMPF32 RaH, RbH
 - [ ] CMPF32 RaH, #16FHi
 - [ ] CMPF32 RaH, #0.0
 - [ ] EINVF32 RaH, RbH
 - [ ] EISQRTF32 RaH, RbH
 - [ ] F32TOI16 RaH, RbH
 - [ ] F32TOI16R RaH, RbH
 - [ ] F32TOI32 RaH, RbH
 - [ ] F32TOUI16 RaH, RbH
 - [ ] F32TOUI16R RaH, RbH
 - [ ] F32TOUI32 RaH, RbH
 - [ ] FRACF32 RaH, RbH
 - [ ] I16TOF32 RaH, RbH
 - [ ] I16TOF32 RaH, mem16
 - [ ] I32TOF32 RaH, mem32
 - [ ] I32TOF32 RaH, RbH
 - [ ] MACF32 R3H, R2H, RdH, ReH, RfH
 - [ ] MACF32 R3H, R2H, RdH, ReH, RfH || MOV32 RaH, mem32
 - [ ] MACF32 R7H, R3H, mem32, *XAR7++
 - [ ] MACF32 R7H, R6H, RdH, ReH, RfH
 - [ ] MACF32 R7H, R6H, RdH, ReH, RfH || MOV32 RaH, mem32
 - [ ] MAXF32 RaH, RbH
 - [ ] MAXF32 RaH, #16FHi
 - [ ] MAXF32 RaH, RbH || MOV32 RcH, RdH
 - [ ] MINF32 RaH, RbH
 - [ ] MINF32 RaH, #16FHi
 - [ ] MINF32 RaH, RbH || MOV32 RcH, RdH
 - [ ] MOV16 mem16, RaH
 - [ ] MOV32 *(0:16bitAddr), loc32
 - [ ] MOV32 ACC, RaH
 - [ ] MOV32 loc32, *(0:16bitAddr)
 - [ ] MOV32 mem32, RaH
 - [ ] MOV32 mem32, STF
 - [ ] MOV32 P, RaH
 - [ ] MOV32 RaH, ACC
 - [ ] MOV32 RaH, mem32 {, CNDF}
 - [ ] MOV32 RaH, P
 - [ ] MOV32 RaH, RbH {, CNDF}
 - [ ] MOV32 RaH, XARn
 - [ ] MOV32 RaH, XT
 - [ ] MOV32 STF, mem32
 - [ ] MOV32 XARn, RaH
 - [ ] MOV32 XT, RaH
 - [ ] MOVD32 RaH, mem32
 - [ ] MOVIZ RaH, #16FHiHex
 - [ ] MOVIZF32 RaH, #16FHi
 - [ ] MOVST0 FLAG
 - [ ] MOVXI RaH, #16FLoHex
 - [ ] MPYF32 RaH, RbH, RcH
 - [ ] MPYF32 RaH, #16FHi, RbH
 - [ ] MPYF32 RaH, RbH, #16FHi
 - [ ] MPYF32 RaH, RbH, RcH || ADDF32 RdH, ReH, RfH
 - [ ] MPYF32 RdH, ReH, RfH || MOV32 RaH, mem32
 - [ ] MPYF32 RdH, ReH, RfH || MOV32 mem32, RaH
 - [ ] MPYF32 RaH, RbH, RcH || SUBF32 RdH, ReH, RfH
 - [ ] NEGF32 RaH, RbH{, CNDF}
 - [ ] POP RB
 - [ ] PUSH RB
 - [ ] RESTORE
 - [ ] RPTB label, loc16
 - [ ] RPTB label, #RC
 - [ ] SAVE FLAG, VALUE
 - [ ] SETFLG FLAG, VALUE
 - [ ] SUBF32 RaH, RbH, RcH
 - [ ] SUBF32 RaH, #16FHi, RbH
 - [ ] SUBF32 RdH, ReH, RfH || MOV32 RaH, mem32
 - [ ] SUBF32 RdH, ReH, RfH || MOV32 mem32, RaH
 - [ ] SWAPF RaH, RbH{, CNDF}
 - [ ] TESTTF CNDF
 - [ ] UI16TOF32 RaH, mem16
 - [ ] UI16TOF32 RaH, RbH
 - [ ] UI32TOF32 RaH, mem32
 - [ ] UI32TOF32 RaH, RbH
 - [ ] ZERO RaH
 - [ ] ZEROA
