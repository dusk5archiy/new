export SYSTEM_DRIVE_LETTER=$(echo $SYSTEMDRIVE | /usr/bin/cut -c1 | /usr/bin/tr '[:upper:]' '[:lower:]')
export HOME_DRIVE_LETTER=$(/usr/bin/cygpath -w / | /usr/bin/cut -c1 | /usr/bin/tr '[:upper:]' '[:lower:]')
