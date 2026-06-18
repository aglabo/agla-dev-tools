#!/usr/bin/env bash
# resolve-paths.spec.sh — integration tests for bin/libs/resolve-paths.lib.sh
# shellcheck disable=SC2016

# ─── Internal Helpers
# pwd = bin/libs/__tests__/integration/ (--execdir @specfile)

_BIN_DIR="$(cd "../.." && pwd)"
_LIB="${_BIN_DIR}/resolve-paths.lib.sh"

# ─── 直接実行 — NODE_PATH を realpath で出力

Describe '直接実行（NODE_PATH を realpath で出力）'
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
    It 'Then: [Normal] node_modules の realpath が出力される'
      When call bash "$_LIB" "${_TMPDIR}/bin"
      The output should equal "${_EXPECTED}"
      The output should not include '..'
    End
  End

  Describe 'When: Unix パス（末尾スラッシュあり）'
    It 'Then: [Normal] 末尾スラッシュを除去して realpath が返る'
      When call bash "$_LIB" "${_TMPDIR}/bin/"
      The output should equal "${_EXPECTED}"
      The output should not include '..'
    End
  End

  Describe 'When: 引数なし'
    It 'Then: [Error] 終了コードが非ゼロ、stderr に Usage を含む'
      When call bash "$_LIB"
      The status should not equal 0
      The stderr should include 'Usage'
    End
  End

  Describe 'When: 存在しないパスを渡す'
    It 'Then: [Error] 終了コードが非ゼロ、stderr に resolve-paths を含む'
      When call bash "$_LIB" "${_TMPDIR}/nonexistent/bin"
      The status should not equal 0
      The stderr should include 'resolve-paths'
    End
  End
End
