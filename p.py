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

# packed 3rd party python module
sys.path.append(os.path.join(os.path.dirname(__file__), "lib"))
from bottle import route, run, static_file, view, abort, redirect, request
from bottle import response

sys.path.append(os.path.dirname(__file__))
# own python module
from service.paster import Paster
from service import formater


paste = Paster("p.db")


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
        format = thing[2]
        if format not in formater.formats_short:
            format = formater.default_format
        return {"title": thing[0],
            "content": thing[1],
            "content_html": formater.format(thing[1], format),
            "format_used": thing[2],
            "time": thing[4],
            "formats_long_to_short": formater.formats_long_to_short,
            "formats_long": formater.formats_long,
            "key": key}
    except KeyError:
        abort(404, "Key " + key + " not found")


@route("/:key/raw")
def view_paste_raw(key):
    try:
        thing = paste.thing[key]
        response.content_type = "text/plain"
        return thing[1]
    except KeyError:
        abort(404, "Key " + key + " not found")


@route('/static/:path#.+#')
def server_static(path):
    return static_file(path, root='./static')

if __name__ == '__main__':
    import bottle
    bottle.debug(True)
    run(host="localhost", port=8080, reloader=True)
else:
    import bottle
    bottle.TEMPLATE_PATH.insert(0,
        os.path.join(os.path.dirname(__file__), 'views/'))
    application = bottle.default_app()
