@ECHO off
:: src: ./bin/ls-lint.cmd
:: @(#) : Wrapper script for ls-lint (Windows)
::
:: Copyright (c) 2026- atsushifx <http://github.com/atsushifx>
::
:: This software is released under the MIT License.
:: https://opensource.org/licenses/MIT
SETLOCAL
CALL "%~dp0libs\resolve-paths.lib.cmd" "%~dp0"
CALL "%BINPATH%\ls-lint.CMD" %*
ENDLOCAL
