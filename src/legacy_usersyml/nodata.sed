#!/bin/sed -urf
# -*- coding: UTF-8, tab-width: 2 -*-
#
# Usage: ./anonymize.sed -- users.yml | ./nodata.sed

s~\b(metadata\.|)([a-z]+): *["'][A-Za-z0-9_ .-]+["']~\1\2: '\r\2 '~g
s~\r(\S{1,4})\S* ~\1~g
s~\b(metadata\.[a-z]+): *[0-9]+~\1: 0~g
s~(\$or: \[)[0-9, ]+\]~\11, 2, 3]~g
s~(\$or: \[')[A-Za-z0-9, '_-]+'\]~\1a', 'b', 'c']~g
