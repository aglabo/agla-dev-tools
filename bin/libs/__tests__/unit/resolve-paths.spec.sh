#!/usr/bin/env bash
# resolve-paths.spec.sh — unit tests for bin/libs/resolve-paths.lib.sh
# shellcheck disable=SC2016

# ─── Internal Helpers
_LIB="$(cd "$(pwd)/../.." && pwd)/resolve-paths.lib.sh"

Describe 'resolve_paths()'
  Describe 'When: base_dir 引数あり'
    It 'Then: [Normal] BINPATH が base_dir/../node_modules/.bin になる'
      When call sh -c '. "$1"; resolve_paths "/fake/bin"; printf "%s\n" "$BINPATH"' _ "$_LIB"
      The output should equal '/fake/bin/../node_modules/.bin'
    End

    It 'Then: [Normal] NODE_PATH が base_dir/../node_modules になる'
      When call sh -c '. "$1"; resolve_paths "/fake/bin"; printf "%s\n" "$NODE_PATH"' _ "$_LIB"
      The output should equal '/fake/bin/../node_modules'
    End

    It 'Then: [Normal] NODE_PATH が子プロセスに export される'
      When call sh -c 'unset NODE_PATH; . "$1"; resolve_paths "/fake/bin"; sh -c '\''printf "%s" "$NODE_PATH"'\''' _ "$_LIB"
      The output should equal '/fake/bin/../node_modules'
    End
  End

  Describe 'When: 引数なし（$0 デフォルト）'
    It 'Then: [Normal] BINPATH に $0 の dirname が使われる'
      When call sh -c '. "$1"; resolve_paths; printf "%s\n" "$BINPATH"' /fake/bin/shim "$_LIB"
      The output should equal '/fake/bin/../node_modules/.bin'
    End
  End
End
