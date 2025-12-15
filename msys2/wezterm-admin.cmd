@echo off
set CWD=%~dp0
set CWD=%CWD:~0,-1%
set "APP_PATH=%CWD%\wezterm.cmd"

powershell -Command "Start-Process -FilePath '%APP_PATH%' -Verb RunAs"
