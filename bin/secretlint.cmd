@ECHO off
SETLOCAL
SET "dp0=%~dp0"
SET "BINPATH=%dp0%..\node_modules\.bin"
CALL "%BINPATH%\secretlint.CMD" %*
ENDLOCAL
