# -----------------------------------------------------------------------------

export SYSTEM_DRIVE_LETTER=$(echo $SYSTEMDRIVE | /usr/bin/cut -c1 | /usr/bin/tr '[:upper:]' '[:lower:]')
export HOME_DRIVE_LETTER=$(/usr/bin/cygpath -w / | /usr/bin/cut -c1 | /usr/bin/tr '[:upper:]' '[:lower:]')

# -----------------------------------------------------------------------------

/usr/bin/mkdir -p "$APPS_DIR"
/usr/bin/mkdir -p "$VAR_APPS_DIR"

/usr/bin/mkdir -p "$VAR_SETTINGS_DIR"
/usr/bin/mkdir -p "$VAR_SETTINGS_DIR/env"
/usr/bin/mkdir -p "$VAR_SETTINGS_DIR/init"
/usr/bin/mkdir -p "$VAR_SETTINGS_DIR/path"
/usr/bin/mkdir -p "$VAR_SETTINGS_DIR/scripts"

/usr/bin/mkdir -p "$SETTINGS_DIR"
/usr/bin/mkdir -p "$SETTINGS_DIR/config"
/usr/bin/mkdir -p "$SETTINGS_DIR/env"
/usr/bin/mkdir -p "$SETTINGS_DIR/init"
/usr/bin/mkdir -p "$SETTINGS_DIR/path"
/usr/bin/mkdir -p "$SETTINGS_DIR/scripts"

# -----------------------------------------------------------------------------

export EXTERNAL_PROGRAMS_FILE="$SETTINGS_DIR/EXTERNAL_PROGRAMS.txt"
/usr/bin/touch $EXTERNAL_PROGRAMS_FILE

EXTERNAL_PATH=""
while IFS= read -r line || [[ -n "$line" ]]; do
  line="${line//[[:space:]]/}"
  p=$(/usr/bin/dirname "$(/usr/bin/which "$line")")
  if [[ ! -z "$p" ]]; then
    EXTERNAL_PATH="$EXTERNAL_PATH:$p"
  fi
done <"$EXTERNAL_PROGRAMS_FILE"
EXTERNAL_PATH="${EXTERNAL_PATH:1}"

# -----------------------------------------------------------------------------

source $SYSTEM_DIR/assets/etc/profile

# -----------------------------------------------------------------------------

mkdir -p "$HOME/AppData"

export APPDATA=$(cygpath -w "$HOME/AppData/Roaming")
mkdir -p "$APPDATA"

export LOCALAPPDATA=$(cygpath -w "$HOME/AppData/Local")
mkdir -p "$LOCALAPPDATA"

export XDG_CONFIG_HOME="$HOME/.config"
mkdir -p "$XDG_CONFIG_HOME"

export XDG_DATA_HOME=$HOME/.local/share
mkdir -p "$XDG_DATA_HOME"

export XDG_CACHE_HOME="$HOME/.cache"
mkdir -p "$XDG_CACHE_HOME"

export XDG_STATE_HOME="$HOME/.local/state"
mkdir -p "$XDG_STATE_HOME"

export TMP="$HOME/tmp"
export TEMP="$HOME/tmp"
mkdir -p "$TMP"

export ORIGINAL_USERPROFILE="/$SYSTEM_DRIVE_LETTER/Users/$(/usr/bin/whoami)"

export USERPROFILE=$(cygpath -w "$HOME/profile")
mkdir -p "$USERPROFILE"

export DESKTOP="$USERPROFILE\Desktop"
mkdir -p $DESKTOP

DOCUMENTS="$USERPROFILE\Documents"
mkdir -p $DOCUMENTS

# export HOMEPATH=\\home

export ORIGINAL_HOME="/home/$(/usr/bin/whoami)"
mkdir -p "$ORIGINAL_HOME"
mkdir -p "$ORIGINAL_HOME/.ssh"

touch "$ORIGINAL_HOME/.ssh/authorized_keys"

# -----------------------------------------------------------------------------

for file in "$SYSTEM_DIR/env"/*.sh; do
  [[ -f "$file" ]] && source "$file"
done

for file in "$VAR_SETTINGS_DIR/env"/*.sh; do
  [[ -f "$file" ]] && source "$file"
done

for file in "$SETTINGS_DIR/env"/*.sh; do
  [[ -f "$file" ]] && source "$file"
done

# -----------------------------------------------------------------------------

for file in "$SYSTEM_DIR/init"/*.sh; do
  [[ -f "$file" ]] && source "$file"
done

for file in "$VAR_SETTINGS_DIR/init"/*.sh; do
  [[ -f "$file" ]] && source "$file"
done

for file in "$SETTINGS_DIR/init"/*.sh; do
  [[ -f "$file" ]] && source "$file"
done

# -----------------------------------------------------------------------------

CUSTOM_PATH="$SETTINGS_DIR/scripts:$VAR_SETTINGS_DIR/scripts:$SYSTEM_DIR/scripts:$STORE_DIR"

addpath() {
  local dir="$1"
  CUSTOM_PATH="$CUSTOM_PATH:$dir"
}

for file in "$SETTINGS_DIR/path"/*.sh; do
  [[ -f "$file" ]] && source "$file"
done

for file in "$VAR_SETTINGS_DIR/path"/*.sh; do
  [[ -f "$file" ]] && source "$file"
done

for file in "$SYSTEM_DIR/path"/*.sh; do
  [[ -f "$file" ]] && source "$file"
done

export PATH="$CUSTOM_PATH:$PATH"

unset addpath
unset CUSTOM_PATH

# -----------------------------------------------------------------------------

if [[ ! -z "$EXTERNAL_PATH" ]]; then
  export PATH="$EXTERNAL_PATH:$PATH"
fi
unset EXTERNAL_PATH

# -----------------------------------------------------------------------------

# if [ -f "$USERPROFILE\.bash_profile" ]; then
#   source "$USERPROFILE\.bash_profile"
# fi

# -----------------------------------------------------------------------------

current_dir="$(pwd)"
if [[ $current_dir == "/$SYSTEM_DRIVE_LETTER/Users/$(/usr/bin/whoami)" ]]; then
  cd $DESKTOP
fi

# -----------------------------------------------------------------------------
