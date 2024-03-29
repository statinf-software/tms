#!/usr/bin/python3

import sys, re

def main(argv):
    all_instrs = []
    for nmpfile in argv:
        file = open(nmpfile, 'r')
        lines = file.readlines()
        previous_line = None
        for line in lines:
            x = re.search("^op ([^\s\(]*)\(", line.strip())
            if x:
                all_instrs += [(x.group(1), previous_line)]
            previous_line = line
    # all_instrs.sort()

    print("/*\n * TMS Instruction Set\n * \n"+\
        " * File generated by gen_list.py\n */\n\n"+\
        "// All instructions extracted from: "+','.join(argv)+"\n"+\
        "op allinstr =")
    first_time = True
    for (instr, previous_line) in all_instrs:
        prefix = "\t  " if first_time else "\t| "
        suffix = ""
        if previous_line and previous_line.startswith("//"):
            suffix = previous_line.strip()
        print(prefix + instr.ljust(25) + suffix)
        first_time = False

if __name__ == "__main__":
    main(sys.argv[1:])
