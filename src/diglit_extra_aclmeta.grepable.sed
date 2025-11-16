#!/bin/sed -nrf
# -*- coding: UTF-8, tab-width: 2 -*-
/^ +'\S+':$/{
  : book
  /\n\s*$/!{N; b book}
  s~ ~~g
  s~'~~g
  s~\nsammlung:([0-9]+)~\t#\1#~
  s~\ngnt_oai_[^:]+:([^:\n]+)~\t<\1>~g
  s~\s+$~~
  s~^~:~
  p
}
