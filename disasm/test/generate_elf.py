#!/usr/bin/python3

import sys

def write_elf_header(f):
    header_bytes = b'\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\
\x02\x00\x8d\x00\x01\x00\x00\x00\x00\x00\x00\x00\x45\x00\x02\x00\
\x45\x00\x02\x00\x00\x00\x00\x004\x00\x00\x00\x00\x00(\x00\
\04\x00\03\x00'
    # shoff = int.from_bytes(header_bytes[32:36], "little")
    # e_flags = int.from_bytes(header_bytes[36:40], "little")
    e_ehsize = int.from_bytes(header_bytes[40:42], "little")
    # e_phentsize = int.from_bytes(header_bytes[42:44], "little")
    # e_phnum = int.from_bytes(header_bytes[44:46], "little")
    e_shentsize = int.from_bytes(header_bytes[46:48], "little")
    # e_shnum = int.from_bytes(header_bytes[48:50], "little")
    # e_shstrndx = int.from_bytes(header_bytes[50:52], "little")

    f.write(header_bytes)
    
    return e_ehsize,e_shentsize


def write_code_section(f,nbr_inst=2**16,inst_size=2):
    for op_code in range(nbr_inst):
        f.write(op_code.to_bytes(inst_size, 'little'))
    code_size = inst_size*nbr_inst

    return code_size


def update_elf_header(f,shoff):
    f.seek(28)
    f.write(shoff.to_bytes(4, 'little')) # program header offset
    f.write(shoff.to_bytes(4, 'little')) # sections header offset


def write_sections_header(f,code_size,shoff,strtab_off,e_ehsize,e_shentsize):
    # null section header
    f.write(b'\x00'*e_shentsize)

    # code section header
    code_sec_hdr_bytes = b'\x01\x00\x00\x00\x01\x00\x00\x00\x06\x00\x00\x00\x00\x00\x00\x00\
4\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\
\x01\x00\x00\x00\x00\x00\x00\x00'
    f.write(code_sec_hdr_bytes)
    sec_start = shoff+e_shentsize*1
    f.seek(sec_start+16)
    f.write(e_ehsize.to_bytes(4, 'little')) #section offset
    f.write(code_size.to_bytes(4, 'little')) #section size
    f.seek(sec_start+e_shentsize)

    # symtab section header
#     symtab_sec_hdr_bytes = b'\x07\x00\x00\x00\x02\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\
# \x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\
# \x00\x00\x00\x00\x01\x00\x00\x00' # with size = 1 symbol -> 0 symbol in OTAWA
    symtab_sec_hdr_bytes = b'\x07\x00\x00\x00\x02\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\
\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\
\x00\x00\x00\x00\x01\x00\x00\x00'
    f.write(symtab_sec_hdr_bytes)
    sec_start = shoff+e_shentsize*2
    f.seek(sec_start+16)
    f.write(strtab_off.to_bytes(4, 'little'))
    f.seek(sec_start+e_shentsize)

    # strtab section header
    strtab_sec_hdr_bytes = b'\x0f\x00\x00\x00\x03\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\
\x00\x00\x00\x00\x19\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\
\x00\x00\x00\x00\x01\x00\x00\x00'
    # f.write(b'\x00'*e_shentsize)
    f.write(strtab_sec_hdr_bytes)
    sec_start = shoff+e_shentsize*3
    # f.seek(sec_start)
    # name_off = 15
    # f.write(name_off.to_bytes(4, 'little'))
    # sec_type = 3
    # f.write(sec_type.to_bytes(4, 'little'))
    # flags = 32
    # f.write(flags.to_bytes(4, 'little'))
    f.seek(sec_start+16)
    f.write(strtab_off.to_bytes(4, 'little'))
    # strtab_size = 25
    # f.write(strtab_size.to_bytes(4, 'little'))
    # f.seek(sec_start+36)
    # strtab_size = 1
    # f.write(strtab_size.to_bytes(4, 'little'))
    f.seek(sec_start+e_shentsize)


def write_strtab_section(f):
    strtab_bytes = b'\x00.text\x00.symtab\x00.shstrtab\x00'
    f.write(strtab_bytes)
    return len(strtab_bytes)


def main(argv):
    assert(argv[0])
    try:
        nbr_inst_bit = int(argv[1])
        if nbr_inst_bit>32:
            print('ERROR!: second argument should be less than 32')
    except ValueError:
        print('ERROR!: second argument should be an integer')
        sys.exit(1)
    
    inst_size = 2 if nbr_inst_bit/8<=2 else 4

    with open(argv[0],'wb') as f:
        e_ehsize, e_shentsize = write_elf_header(f)
        code_size = write_code_section(f, nbr_inst=2**nbr_inst_bit,inst_size=inst_size)
        
        strtab_off = f.tell()
        write_strtab_section(f)

        shoff = f.tell()
        write_sections_header(f,code_size,shoff,strtab_off,e_ehsize,e_shentsize)
        
        update_elf_header(f,shoff)


if __name__ == '__main__':
    main(sys.argv[1:])
    


    

            
            
            