#! /usr/bin/python
# -*- coding: utf-8 -*-
# %%%{CotEditorXInput=Selection}%%%
# %%%{CotEditorXOutput=ReplaceSelection}%%%

import sys

text = ""
for line in sys.stdin:
    text += ( line.rstrip('\n') + " " )
print text
