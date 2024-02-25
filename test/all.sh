#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-


function test_all () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  local REPO_DIR="$(readlink -m -- "$BASH_SOURCE"/../..)"
  cd -- "$REPO_DIR" || return $?
  exec </dev/null

  local BEST_DIFF=
  for BEST_DIFF in colordiff diff ; do
    which "$BEST_DIFF" 2>/dev/null | grep -qPe '^/' && break
  done

  local TFD='test/fixtures'
  local FFC_BFN='frontend_fixture_cpgs'
  local FFC_DAM="$FFC_BFN.diglit_aclmeta"
  local DEST="tmp.$FFC_DAM.yaml"
  ./src/diglit_extra_aclmeta.sed "$TFD/$FFC_BFN.input.yaml" \
    >"$DEST" || return $?
  "$BEST_DIFF" -sU 2 -- "$TFD/$FFC_DAM.yaml" "$DEST" || return $?

  echo +OK 'All tests passed.'
}










test_all "$@"; exit $?
