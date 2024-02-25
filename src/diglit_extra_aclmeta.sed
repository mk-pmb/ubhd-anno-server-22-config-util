#!/bin/sed -nurf
# -*- coding: UTF-8, tab-width: 2 -*-

: main_copy
  p
: main_next
  n
: main_gate
  /^$/b main_next
  /^\s+oaisets:/b translate_oaiset
  s~^( {2})(sammlung):~\1  \2:~
  s~^['"A-Za-z0-9]~\n  &~
  /^\-{3}$/a^:
  /^\.{3}$/i
b main_copy


: translate_oaiset
  n
  /^ {4}\- /!b main_gate
  s~['"]~~g
  s~^( {4})\- (\S+)$~\1gnt_oai_\2: '\2'~p
b translate_oaiset
