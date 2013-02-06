# coding: utf8
'''
Created on 20.09.2011

@author: Kevin Zuber

Copyright (c) 2011, Kevin Zuber.
License: MIT (see LICENSE for details)
'''
from pygments import highlight
from pygments.lexers import get_lexer_by_name
from pygments.lexers import get_all_lexers
from pygments.formatters import HtmlFormatter

formats_long_to_short = {}
formats_short_to_long = {}
formats_long = []
formats_short = []
for lexer in get_all_lexers():
    lexer_short = lexer[1][0]
    lexer_long = lexer[0]
    formats_long_to_short[lexer_long] = lexer_short
    formats_short_to_long[lexer_short] = lexer_long
    formats_long.append(lexer_long)
    formats_short.append(lexer_short)


format_default = "text" if "text" in formats_short else formats_short[0]

formats_long.sort(key=str.lower)
formats_short.sort(key=str.lower)


def format(content, source_format):
    lexer = get_lexer_by_name(source_format, stripall=False)
    formatter = HtmlFormatter(linenos=True, cssclass="source")
    return highlight(content, lexer, formatter)
