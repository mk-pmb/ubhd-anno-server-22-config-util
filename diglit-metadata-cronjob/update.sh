#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-


function metadata_updater () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  local SELFPATH="$(readlink -m -- "$BASH_SOURCE"/..)"
  cd -- "$SELFPATH" || return $?
  exec </dev/null
  local -A CFG=()
  source -- config.rc || return $?$(
    echo E: 'Failed to read config file!' >&2)

  local ORIG_YAML="tmp.$$.orig.yaml"
  export ORIG_YAML
  wget --quiet --output-document="$ORIG_YAML" -- "${CFG[metadata_url]}" \
    || return $?$(echo E: 'Failed to download metadata!' >&2)

  "$SELFPATH"/../src/convert_anno_metadata.sh >/dev/null || return $?$(
    echo E: 'Failed to convert metadata!' >&2)
  rm -- "$ORIG_YAML"

  mv --no-target-directory \
    -- 'tmp.diglit_extra_aclmeta.yaml' "${CFG[dest_file]}" \
    || return $?$(echo E: 'Failed to activate new config!' >&2)

  local CURL=(
    curl
    --request POST
    --header 'Remote_User: config_bot'
    --silent
    --output /dev/null
    "${CFG[shutdown_url]}"
    )
  "${CURL[@]}" || return $?$(echo E: 'Failed to request shutdown!' >&2)
}










metadata_updater "$@"; exit $?
