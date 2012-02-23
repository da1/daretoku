#! /usr/bin/python
# -*- coding: utf-8 -*-
# %%%{CotEditorXInput=Selection}%%%
# %%%{CotEditorXOutput=ReplaceSelection}%%%

import sys

print ur"#ifdef "
for line in sys.stdin:
    print line,
print
print ur"#endif"
