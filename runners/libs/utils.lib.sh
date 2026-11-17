#!/usr/bin/env bash
# src: ./runners/libs/utils.lib.sh
# @(#) : common utility library for runner scripts
# Provides helpers shared by multiple runners
#
# Copyright (c) 2026- atsushifx <https://github.com/atsushifx>
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

# Guard against double sourcing
[[ -n "${_UTILS_LIB_SH:-}" ]] && return 0
readonly _UTILS_LIB_SH=1

# Exit code returned by runners when no config file is found (EX_CONFIG)
# shellcheck disable=SC2034 # used by the scripts that source this library
readonly EXIT_CONFIG_NOT_FOUND=78

#
# @description Format the one-line message for a failed resolve_config_file call.
#              resolve_config_file already lists the searched paths on stderr;
#              this is the short summary runners print before returning EXIT_CONFIG_NOT_FOUND
# @arg $1 int Exit status of resolve_config_file
# @arg $2 string Config file path relative to the global config directory
# @arg $3 string Local config file path relative to PROJECT_ROOT
# @stdout Message text (without the "Error: " prefix)
# @exitcode 0 always
#
format_config_not_found() {
  local __status="$1" __global_relpath="$2" __local_relpath="$3"
  echo "config file not found (status ${__status}): global '${__global_relpath}' or local '${__local_relpath}'"
}

#
# @description Resolve the global (user) config directory.
#              Use XDG_CONFIG_HOME when it points to an existing directory,
#              otherwise fall back to ${HOME}/.config
# @stdout Path to the config directory; an empty line when no directory exists
# @exitcode 0 always
#
resolve_global_configdir() {
  local __xdg_config="${XDG_CONFIG_HOME:-}"
  local __home_config="${HOME:-}/.config"

  if [[ -n "$__xdg_config" && -d "$__xdg_config" ]]; then
    echo "$__xdg_config"
  elif [[ -n "${HOME:-}" && -d "$__home_config" ]]; then
    echo "$__home_config"
  else
    echo ""
  fi
}

#
# @description Resolve a tool config file.
#              Use the file under the global config directory when it exists,
#              otherwise use the local config file in the project when it exists
# @arg $1 string Config file path relative to the global config directory
# @arg $2 string Local config file path relative to PROJECT_ROOT
# @stdout Path to the config file
# @stderr Error message listing the searched paths when no file is found
# @exitcode 0 Config file found
# @exitcode 1 Config file not found
#
resolve_config_file() {
  local __global_relpath="$1"
  local __local_config="${PROJECT_ROOT}/$2"
  local __configdir
  __configdir="$(resolve_global_configdir)"

  if [[ -n "$__configdir" && -f "${__configdir}/${__global_relpath}" ]]; then
    echo "${__configdir}/${__global_relpath}"
    return 0
  fi
  if [[ -f "$__local_config" ]]; then
    echo "$__local_config"
    return 0
  fi

  {
    echo "Error: config file not found. Searched:"
    echo "  ${__configdir:-\$XDG_CONFIG_HOME (not found)}/${__global_relpath}"
    echo "  ${__local_config}"
  } >&2
  return 1
}
