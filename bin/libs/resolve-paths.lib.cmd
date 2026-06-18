@ECHO off
:: src: ./bin/libs/resolve-paths.lib.cmd
:: @(#) : Shared library for bin shims — sets BINPATH and NODE_PATH
:: CALL-ONLY: not executable directly.
:: Usage: CALL "%~dp0libs\resolve-paths.lib.cmd" <base_dir>
::   base_dir: caller's directory (pass %~dp0 from the calling shim)
::
:: Copyright (c) 2026- atsushifx <http://github.com/atsushifx>
::
:: This software is released under the MIT License.
:: https://opensource.org/licenses/MIT
SET "BINPATH=%~1..\node_modules\.bin"
SET "NODE_PATH=%~1..\node_modules"
