@echo off
set CWD=%~dp0
set CWD=%CWD:~0,-1%
set W_HOME_DRIVE_LETTER=%~d0
set W_HOME_DRIVE_LETTER=%W_HOME_DRIVE_LETTER::=%
set HOME_DRIVE_LETTER=%W_HOME_DRIVE_LETTER%

for %%L in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
    call set "HOME_DRIVE_LETTER=%%HOME_DRIVE_LETTER:%%L=%%L%%"
)

set "APPS_DIR=%CWD%\apps"
set "HOME=%CWD%\home"
set "MSYS2_DIR=%CWD%\msys64"
set "SETTINGS_DIR=%CWD%\settings"
set "STORE_DIR=%CWD%\s7sys\store"
set "SYSTEM_DIR=%CWD%\s7sys\system"
set "VAR_APPS_DIR=%CWD%\var_apps"
set "VAR_SETTINGS_DIR=%CWD%\var_settings"

set "PROFILE_FILE=%MSYS2_DIR%\etc\profile"

echo export ROOT_DIR=$(/usr/bin/cygpath "%CWD%") > %PROFILE_FILE%
echo export SYSTEM_DIR=$(/usr/bin/cygpath "%SYSTEM_DIR%") >>%PROFILE_FILE%
echo export STORE_DIR=$(/usr/bin/cygpath "%STORE_DIR%") >>%PROFILE_FILE%
echo export SETTINGS_DIR=$(/usr/bin/cygpath "%SETTINGS_DIR%") >>%PROFILE_FILE%
echo export VAR_SETTINGS_DIR=$(/usr/bin/cygpath "%VAR_SETTINGS_DIR%") >>%PROFILE_FILE%
echo export VAR_APPS_DIR=$(/usr/bin/cygpath "%VAR_APPS_DIR%") >>%PROFILE_FILE%
echo export HOME=$(/usr/bin/cygpath "%HOME%") >>%PROFILE_FILE%
echo source $SYSTEM_DIR/main.sh >>%PROFILE_FILE%


%MSYS2_DIR%\usr\bin\bash -l
