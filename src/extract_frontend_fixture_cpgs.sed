#!/bin/sed -nurf
# -*- coding: UTF-8, tab-width: 2 -*-

: head
  /^(%|#|$)/{p;n;b head}
  /^---$/a
b data

: data
  /^\s/b next
  /^$/b next
  /:$/b entry
  p
: next
  n
b data

: entry
  /^[\x22\x27]?cpg(148|389|raec23)[\x22\x27]?:$/b copy_block
  n
b data

: copy_block
  p;n
  /^\s/b copy_block
  i
b data
