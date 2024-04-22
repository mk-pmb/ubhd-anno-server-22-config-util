#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-


function convert_anno_metadata () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  local SELFPATH="$(readlink -m -- "$BASH_SOURCE"/..)"
  exec </dev/null

  [ -n "$ORIG_YAML" ] || local ORIG_YAML="$SELFPATH/../$(
    )cache/annoMetadataYAML.latest.txt"
  [ -f "$ORIG_YAML" ] || return 3$(echo E: >&2 \
    'Cannot find the original annoMetadataYAML data.' \
    'Is the ORIG_YAML env var set correctly?' \
    "Expected to find it at: $ORIG_YAML")
  local VAL="$(tail --bytes=128 -- "$ORIG_YAML" | grep . | tail --lines=1)"
  [ "$VAL" == ... ] || return 3$(echo E: >&2 \
    "Cannot find YAML end marker (failed partial download?) in: $ORIG_YAML")

  local DEST='tmp.diglit_extra_aclmeta.yaml'
  echo P: "Converting… -> $DEST"
  SECONDS=0
  "$SELFPATH"/diglit_extra_aclmeta.sed -- "$ORIG_YAML" >"$DEST"
  echo P: "Converted: $(wc --lines -- "$DEST"), duration ≈ $SECONDS sec."

  echo P: 'All done.'
}








convert_anno_metadata "$@"; exit $?
