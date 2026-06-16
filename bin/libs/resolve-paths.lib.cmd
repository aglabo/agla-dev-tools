@ECHO off
:: resolve-paths.lib.cmd — define resolve_paths macro for bin shims
:: CALL-ONLY: not executable directly.
:: Usage: CALL "%~dp0libs\resolve-paths.lib.cmd" <base_dir>
::   base_dir: caller's directory (pass %~dp0 from the calling shim)
SET "BINPATH=%~1..\node_modules\.bin"
SET "NODE_PATH=%~1..\node_modules"
