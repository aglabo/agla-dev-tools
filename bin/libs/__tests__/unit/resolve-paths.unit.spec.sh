#!/usr/bin/env bash
# resolve-paths.spec.sh — unit tests for bin/libs/resolve-paths.lib.sh
# shellcheck disable=SC2016

# ─── Internal Helpers
_LIB="$(cd "$(pwd)/../.." && pwd)/resolve-paths.lib.sh"

# ─── _normalize_path() — path normalization

Describe '_normalize_path()'
  Describe 'When: 各種パス形式'
    It "Then: [Normal] '/tmp/foo/bin' → '/tmp/foo/bin'"
      When call sh -c '. "$1"; _normalize_path "$2"' _ "$_LIB" '/tmp/foo/bin'
      The output should equal '/tmp/foo/bin'
    End

    It "Then: [Normal] '/tmp/foo/bin/' → '/tmp/foo/bin'"
      When call sh -c '. "$1"; _normalize_path "$2"' _ "$_LIB" '/tmp/foo/bin/'
      The output should equal '/tmp/foo/bin'
    End

    It 'Then: [Normal] backslashes converted to forward slashes'
      When call sh -c '. "$1"; _normalize_path "$2"' _ "$_LIB" 'C:\foo\bin'
      The output should equal 'C:/foo/bin'
    End

    It 'Then: [Normal] trailing backslash converted and stripped'
      # shellcheck disable=SC1003
      When call sh -c '. "$1"; _normalize_path "$2"' _ "$_LIB" 'C:\foo\bin\'
      The output should equal 'C:/foo/bin'
    End

    It "Then: [Normal] empty string → empty string"
      When call sh -c '. "$1"; _normalize_path "$2"' _ "$_LIB" ''
      The output should equal ''
    End
  End
End

# ─── _resolve_node_path() — resolve node_modules realpath

Describe '_resolve_node_path()'
  Before 'setup'
  After 'teardown'

  setup() {
    _TMPDIR="$(mktemp -d)"
    mkdir -p "${_TMPDIR}/bin"
    mkdir -p "${_TMPDIR}/node_modules"
    _EXPECTED="$(realpath "${_TMPDIR}/node_modules")"
  }

  teardown() {
    rm -rf "${_TMPDIR}"
  }

  Describe 'When: Unix パス（通常）'
    It 'Then: [Normal] node_modules の realpath が出力される（.. を含まない）'
      When call sh -c '. "$1"; _resolve_node_path "$2"' _ "$_LIB" "${_TMPDIR}/bin"
      The output should equal "${_EXPECTED}"
      The output should not include '..'
    End
  End

  Describe 'When: Unix パス（末尾スラッシュあり）'
    It 'Then: [Normal] 末尾スラッシュを除去して realpath が返る'
      When call sh -c '. "$1"; _resolve_node_path "$2"' _ "$_LIB" "${_TMPDIR}/bin/"
      The output should equal "${_EXPECTED}"
      The output should not include '..'
    End
  End

  Describe 'When: 存在しないパスを渡す'
    It 'Then: [Error] 終了コードが非ゼロ、stderr に resolve-paths を含む'
      When call sh -c '. "$1"; _resolve_node_path "$2"' _ "$_LIB" "${_TMPDIR}/nonexistent/bin"
      The status should not equal 0
      The stderr should include 'resolve-paths'
    End
  End
End

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
