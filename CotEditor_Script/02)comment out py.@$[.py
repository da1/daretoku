#! /usr/bin/python
# -*- coding: utf-8 -*-
# %%%{CotEditorXInput=Selection}%%%
# %%%{CotEditorXOutput=ReplaceSelection}%%%

import sys
import codecs

sys.stdout = codecs.getwriter('utf_8')(sys.stdout)
for line in sys.stdin:
    print ur"#" + line.decode("utf_8"),
