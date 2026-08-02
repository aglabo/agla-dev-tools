@ECHO off
:: src: ./bin/rimraf.cmd
:: @(#) : Wrapper script for rimraf (Windows)
::
:: Copyright (c) 2026- atsushifx <http://github.com/atsushifx>
::
:: This software is released under the MIT License.
:: https://opensource.org/licenses/MIT
SETLOCAL
FOR /F "usebackq delims=" %%N IN (`bash "%~dp0libs\resolve-paths.lib.sh" "%~dp0/"`) DO SET "NODE_PATH=%%N"
SET "BINPATH=%NODE_PATH%\.bin"
CALL "%BINPATH%\rimraf.CMD" %*
ENDLOCAL
