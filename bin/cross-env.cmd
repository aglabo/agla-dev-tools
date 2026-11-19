@echo off
:: src: ./bin/cross-env.cmd
:: @(#) : Wrapper script for cross-env (Windows)
::
:: Copyright (c) 2026- atsushifx <https://github.com/atsushifx>
::
:: This software is released under the MIT License.
:: https://opensource.org/licenses/MIT
SETLOCAL
FOR /F "usebackq delims=" %%N IN (`bash "%~dp0libs\resolve-paths.lib.sh" "%~dp0/"`) DO SET "NODE_PATH=%%N"
SET "BINPATH=%NODE_PATH%\.bin"
CALL "%BINPATH%\cross-env.CMD" %*
ENDLOCAL
