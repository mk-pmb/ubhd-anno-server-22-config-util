#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-

function legacy_usersyml_structure () {
  local SP="$(readlink -m -- "$BASH_SOURCE"/..)"
  local UY="${1:-tmp.users.yml}"
  local LU='legacy_usersyml'

  local OP="tmp.$LU.optimized.txt"
  "$SP"/optimize.sed -- "$UY" >"$OP" || return $?
  diff -sU 1 -- "$UY" "$OP" >"${OP%.*}.diff"

  local AN="tmp.$LU.anonymized.txt"
  nl -- "$OP" | "$SP"/anonymize.sed >"$AN" || return $?

  local ND="tmp.$LU.nodata.txt"
  "$SP"/anonymize.sed -- "$OP" | "$SP"/nodata.sed >"$ND" || return $?

  local ST="tmp.$LU.structure.txt"
  <"$ND" sort --reverse | uniq --count >"$ST" || return $?

  grep -Fe collection: "$AN" | sort | uniq -c | sort -rg | nl \
    >tmp.coll_combo_toplist.txt || return $?
}


legacy_usersyml_structure "$@"; exit $?
