# Test with generated instructions

First, you need to create `test_all_16bit_inst.elf` by running `generate_elf.py` script from
`disasm/test` directory.
``` bash
cd disasm/test
python generate_elf.py test_all_16bit_inst.elf 16
```

Then, you can apply GLISS disassembler on generated file:
``` bash
cd disasm
./tms-disasm test/test_all_16bit_inst.elf |tail -n +11 > test/test_all_16bit_inst_gliss.asm
```

You can also generate disassembly using `dis2000` from [TI C2000 compiler](https://www.ti.com/tool/C2000-CGT) and the normalization script `normalise_disasm.py`
``` bash
cd disasm/test
dis2000 test_all_16bit_inst.elf > test_all_16bit_inst.asm
python normalize_disasm.py test_all_16bit_inst.asm > test_all_16bit_inst_norm.asm
```

Finally, you can compare the two disassembly version:
``` bash
cd disasm/test
diff -y --color test_all_16bit_inst_gliss.asm  test_all_16bit_inst_norm.asm
```