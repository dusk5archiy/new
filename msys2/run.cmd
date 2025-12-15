@echo off
set CWD=%~dp0
set CWD=%CWD:~0,-1%
set W_HOME_DRIVE_LETTER=%~d0
set W_HOME_DRIVE_LETTER=%W_HOME_DRIVE_LETTER::=%
set HOME_DRIVE_LETTER=%W_HOME_DRIVE_LETTER%

for %%L in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
    call set "HOME_DRIVE_LETTER=%%HOME_DRIVE_LETTER:%%L=%%L%%"
)

set "MSYS2_DIR=%CWD%\msys64"
set "CUSTOM_SETTINGS_DIR=%CWD%\custom_settings"
set "SYSTEM_DIR=%CWD%\custom_system\system"
set "STORE_DIR=%CWD%\custom_system\store"
set "APPS_DIR=%CWD%\custom_apps"
set "HOME=%CWD%\home"

set "PROFILE_FILE=%MSYS2_DIR%\etc\profile"

echo export SYSTEM_DIR=$(/usr/bin/cygpath "%SYSTEM_DIR%") > %PROFILE_FILE%
echo export STORE_DIR=$(/usr/bin/cygpath "%STORE_DIR%") >>%PROFILE_FILE%
echo export CUSTOM_SETTINGS_DIR=$(/usr/bin/cygpath "%CUSTOM_SETTINGS_DIR%") >>%PROFILE_FILE%
echo export APPS_DIR=$(/usr/bin/cygpath "%APPS_DIR%") >>%PROFILE_FILE%
echo export HOME=$(/usr/bin/cygpath "%HOME%") >>%PROFILE_FILE%
echo source $SYSTEM_DIR/main.sh >>%PROFILE_FILE%


%MSYS2_DIR%\usr\bin\bash -l
pause
