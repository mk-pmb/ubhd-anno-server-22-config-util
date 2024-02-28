#!/bin/sed -urf
# -*- coding: UTF-8, tab-width: 2 -*-
#
# Usage: nl -- users.yml | ./anonymize.sed

s~^ *([0-9]+\t)~\1~
s~/shibboleth!~\n\t&~
s~^([0-9]+\t|)([ -]*')https://[^']+\n\t[^']*~\2https://shibboleth.idp/\1~
s~^([0-9]+\t|)([ -]*')\S+@(\S+\.\S+|dummy)'~\2\1user@host.tld'~
s~^([0-9]+\t|)( +displayName): +["'][^"']+["']( +# .*|)$~\2: '\1Name'~
s~^[0-9]+\t~~
s~(\.idp/[0-9]+)\t~\1/~g
s~([0-9]+)\t([A-Za-z]+)~\2\1~g

s~\s+$~~
/^ *#/d
s~^( +icon: 'http)s?://[^']+'$~\1://...'~
s~(:|,) +~\1 ~g
s~ +# (Fr\.|Frau|Hr\.|Herr) [A-Z][a-z]+$~~
s~ +# or 'moderator'$~~
