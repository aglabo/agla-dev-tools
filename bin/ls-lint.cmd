@ECHO off
REM src: bin/ls-lint.cmd
REM @(#) : ls-lint wrapper (cmd)
REM
REM Copyright (c) 2026- atsushifx https://github.com/atsushifx
REM
REM This software is released under the MIT License.
REM https://opensource.org/licenses/MIT
SETLOCAL
SET "TOOL=ls-lint"
CALL "%~dp0libs\run-node-bin.cmd" %*
ENDLOCAL & EXIT /B %ERRORLEVEL%
