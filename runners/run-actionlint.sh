#!/usr/bin/env bash
# src: ./runners/run-actionlint.sh
# @(#) : action lint runner
#
# Copyright (c) 2026- atsushifx <https://github.com/atsushifx>
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

# shellcheck disable=SC1091

set -euo pipefail

# shellcheck source=runners/libs/init-vars.lib.sh
. "$(dirname "${BASH_SOURCE[0]}")/libs/init-vars.lib.sh"

# shellcheck source=runners/libs/utils.lib.sh
. "${SCRIPT_ROOT}/libs/utils.lib.sh"

# Config file path relative to the global config directory
readonly CONFIG_GLOBAL_RELPATH='global-configs/jactionlint.yaml'

# Config file path relative to PROJECT_ROOT
readonly CONFIG_LOCAL_RELPATH='configs/jactionlint.yaml'

# @description Run jactionlint with the global config,
#              or with the checked-in config when the global one is absent
# @arg $@ Arguments forwarded to jactionlint
# @stderr "Error: <not-found message>" when no config file is found
# @exitcode Exit code of jactionlint
# @exitcode 78 (EXIT_CONFIG_NOT_FOUND) Config file not found
main() {
  local configFile status=0
  configFile="$(resolve_config_file "$CONFIG_GLOBAL_RELPATH" "$CONFIG_LOCAL_RELPATH")" || status=$?
  if [[ $status -ne 0 ]]; then
    echo "Error: $(format_config_not_found "$status" "$CONFIG_GLOBAL_RELPATH" "$CONFIG_LOCAL_RELPATH")" >&2
    return "$EXIT_CONFIG_NOT_FOUND"
  fi

  jactionlint --config-file "$configFile" "$@"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  main "$@"
  exit $?
fi
