#!/usr/env python
# coding: utf8
'''
Created on 20.09.2011

p is a paste service. As the brother of s it is designed to be fast and small.

@author: Kevin Zuber
'''
# python standard library
import sys
import os

# 3rd party python module

from bottle import route, run, static_file, view, abort, redirect, request
from bottle import response
import bottle

sys.path.append(os.path.dirname(__file__))

# own python module
from service.paster import Paster
from service import formater


paste = Paster(os.path.join(os.path.dirname(__file__),"p.db"))


def force_unicode(obj, encoding='utf-8'):
    if isinstance(obj, basestring):
        if not isinstance(obj, unicode):
            obj = unicode(obj, encoding)
        return obj

fu = force_unicode


@route("/")
@view("index")
def index():
    return {"format_default": formater.format_default,
            "formats_long_to_short": formater.formats_long_to_short,
            "formats_short_to_long": formater.formats_short_to_long,
            "top_formats": paste.top_formats,
            "formats_long": formater.formats_long}


@route("/", method="POST")
def add_paste():
    f = request.forms
    if f.format not in formater.formats_short:
        f.format = formater.format_default
    if f.title and f.content and f.format:
        key = paste.add(fu(f.title), fu(f.content),
        fu(f.format), request['REMOTE_ADDR'])
        redirect("/" + key)
    else:
        abort(400, "You did not provide all required fields.")


@route("/:key")
@view("view_paste")
def view_paste(key):
    try:
        thing = paste.thing[key]
        format = thing["format"]
        if format not in formater.formats_short:
            format = formater.default_format
        return {"title": thing["title"],
            "content": thing["content"],
            "content_html": formater.format(thing["content"], format),
            "format_used": thing["format"],
            "time": thing["time"],
            "formats_long_to_short": formater.formats_long_to_short,
            "formats_short_to_long": formater.formats_short_to_long,
            "formats_long": formater.formats_long,
            "top_formats": paste.top_formats,
            "key": key}
    except KeyError:
        abort(404, "Key " + key + " not found")


@route("/:key/raw")
def view_paste_raw(key):
    try:
        thing = paste.thing[key]
        response.content_type = "text/plain; charset=utf-8"
        return thing["content"]
    except KeyError:
        abort(404, "Key " + key + " not found")


@route('/static/:path#.+#')
def server_static(path):
    return static_file(path, root='./static')

bottle.TEMPLATE_PATH.insert(0,
        os.path.join(os.path.dirname(__file__), 'views/'))

if __name__ == '__main__':
    bottle.debug(True)
    run(host="localhost", port=8080, reloader=True)
else:
    
    application = bottle.default_app()
