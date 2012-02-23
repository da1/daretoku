#! /usr/bin/python
# -*- coding: utf-8 -*-
# %%%{CotEditorXInput=Selection}%%%
# %%%{CotEditorXOutput=ReplaceSelection}%%%

import sys
import urllib
txt = reduce(lambda x,y:x+y,sys.stdin)
print urllib.quote(txt)
