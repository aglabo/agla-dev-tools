# shellcheck shell=sh
# src: ./bin/libs/resolve-paths.lib.sh
# @(#) : Shared library for bin shims — defines resolve_paths()
# SOURCE-ONLY: not executable. Do not run directly.
#
# Copyright (c) 2026- atsushifx <http://github.com/atsushifx>
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

# shellcheck disable=SC3043
resolve_paths() {
  local _base="${1:-$(dirname "$0")}"
  BINPATH="${_base}/../node_modules/.bin"
  NODE_PATH="${_base}/../node_modules"
  export BINPATH NODE_PATH
}
