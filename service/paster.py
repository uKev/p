# coding: utf8
'''
Created on 20.09.2011

@author: Kevin Zuber
'''
import sqlite3
import time
import base64
import struct


def id_to_key(id):
    data = struct.pack('<Q', id).rstrip('\x00')
    if len(data) == 0:
        data = '\x00'
    s = base64.urlsafe_b64encode(data).rstrip('=')
    return s


def key_to_id(key):
    data = base64.urlsafe_b64decode(key + '==')
    n = struct.unpack('<Q', data + '\x00' * (8 - len(data)))
    return n[0]


class GetThing(object):

    def __init__(self, connection):
        self.__connection = connection

    def __getitem__(self, key):
        try:
            id = (key_to_id(key), )
        except TypeError:
            raise KeyError
        c = self.__connection.cursor()
        row = c.execute(
            "select title,content,format,ip,time from pastes where id=?",
            id).fetchone()
        if row:
            return row
        else:
            raise KeyError


class Paster(object):

    @property
    def top_formats(self):
        c = self.__connection.cursor()
        rows = c.execute("""SELECT count(format) AS count, format FROM pastes 
        GROUP BY format ORDER BY count DESC LIMIT 10  
        """).fetchall()
        return rows
    
    def __init__(self, db_file):
        self.db_file = db_file
        self.__connection = sqlite3.connect(db_file, detect_types=sqlite3.PARSE_DECLTYPES)
        self.__connection.row_factory = sqlite3.Row
        self.thing = GetThing(self.__connection)

        c = self.__connection.cursor()
        c.execute("""create table if not exists pastes
        (id INTEGER PRIMARY KEY, title TEXT, content TEXT, format TEXT, ip
        TEXT, time INTEGER)""")
        self.__connection.commit()

    def add(self, title, content, format, ip):
        c = self.__connection.cursor()
        v = (title, content, format, ip, int(time.time()))
        c.execute("""insert into pastes (title, content, format, ip, time)
            values (?, ?, ?, ?, ?)""", v)
        id = c.lastrowid
        self.__connection.commit()
        return id_to_key(id)
    
