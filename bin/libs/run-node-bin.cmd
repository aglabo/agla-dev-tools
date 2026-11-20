@ECHO off
REM src: bin/libs/run-node-bin.cmd
REM @(#) : shared runner for bin\ tool wrappers
REM
REM Copyright (c) 2026- atsushifx https://github.com/atsushifx
REM
REM This software is released under the MIT License.
REM https://opensource.org/licenses/MIT
REM
REM Usage: SET "TOOL=TOOL_NAME" then CALL run-node-bin.cmd [args...]
REM (%* is not affected by SHIFT, so the tool name is passed via TOOL)
SET "dp0=%~dp0"
SET "NODE_PATH=%dp0%..\..\node_modules"
SET "BINPATH=%NODE_PATH%\.bin"
CALL "%BINPATH%\%TOOL%.CMD" %*
