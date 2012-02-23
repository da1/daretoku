#! /usr/bin/python
# -*- coding: utf-8 -*-
# %%%{CotEditorXInput=Selection}%%%
# %%%{CotEditorXOutput=ReplaceSelection}%%%

import sys
import re

re_sharp = re.compile("[ ]*#")
re_slash = re.compile("[ ]*//")

for line in sys.stdin:
    if re_sharp.match(line) != None:
        p = line.find("#")
        print line[:p] + line[p+1:],
    elif re_slash.match(line) != None:
        p = line.find("//")
        print line[:p] + line[p+2:],
    else:
        print line,
#    if line[0] == "#":
#        print line[1:],
#    elif line[:2] == "//":
#        print line[2:],

