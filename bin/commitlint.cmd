@ECHO off
:: src: ./bin/commitlint.cmd
:: @(#) : Wrapper script for commitlint (Windows)
::
:: Copyright (c) 2026- atsushifx <http://github.com/atsushifx>
::
:: This software is released under the MIT License.
:: https://opensource.org/licenses/MIT
SETLOCAL
CALL "%~dp0libs\resolve-paths.lib.cmd" "%~dp0"
CALL "%BINPATH%\commitlint.CMD" %*
ENDLOCAL
