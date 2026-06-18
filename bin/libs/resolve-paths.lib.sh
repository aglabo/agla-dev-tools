# shellcheck shell=sh
# src: ./bin/libs/resolve-paths.lib.sh
# @(#) : Shared library for bin shims — defines resolve_paths()
# When sourced: sets BINPATH and NODE_PATH as exports via resolve_paths().
# When executed directly: prints NODE_PATH realpath to stdout.
#
# Copyright (c) 2026- atsushifx <http://github.com/atsushifx>
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

# shellcheck disable=SC3043
_normalize_path() {
  local _path="$1"
  # shellcheck disable=SC1003
  printf '%s' "${_path}" | tr '\\' '/' | sed 's|/*$||'
}

# shellcheck disable=SC3043
_resolve_node_path() {
  local _base
  _base="$(_normalize_path "$1")"
  local _node_path
  _node_path="$(realpath "${_base}/../node_modules" 2>/dev/null)" ||
    {
      printf 'resolve-paths: cannot resolve %s\n' "${_base}/../node_modules" >&2
      return 1
    }
  printf '%s\n' "${_node_path}"
}

# shellcheck disable=SC3043
resolve_paths() {
  local _base="${1:-$(dirname "$0")}"
  BINPATH="${_base}/../node_modules/.bin"
  NODE_PATH="${_base}/../node_modules"
  export BINPATH NODE_PATH
}

main() {
  [ -z "$1" ] && {
    printf 'Usage: resolve-paths.lib.sh <base_dir>\n' >&2
    exit 1
  }
  _resolve_node_path "$1"
}

case "$0" in
*resolve-paths.lib.sh) main "$@" ;;
esac
