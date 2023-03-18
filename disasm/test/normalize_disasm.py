#!/usr/bin/python3

import sys, re

def main(argv):
    assert(argv[0])
    file = open(argv[0], 'r')
    lines = file.readlines()

    process = False
    for line in lines:
        outl = line.strip()
        if process:
            x = re.search("^([0-9a-f]{8}   [0-9a-f]{4}   [A-Z]+)\s+(.*)", line.strip())
            if x:
                outl = x.group(1) +" "+ x.group(2)
        print(outl)
        if line.startswith("TEXT Section "):
            process = True

if __name__ == "__main__":
    main(sys.argv[1:])
