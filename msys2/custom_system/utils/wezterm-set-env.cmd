@echo off
set CWD=%~dp0
set CWD=%CWD:~0,-1%
for %%i in ("%CWD%\..\..\settings\config\wezterm\wezterm.lua") do set "p=%%~fi"
setx WEZTERM_CONFIG_FILE "%p%" /M
pause

