# -----------------------------------------------------------------------------

export $SYSTEM_DIR="$HOME/custom_system/system"
export $STORE_DIR="$HOME/custom_system/store"
export $VAR_SETTINGS_DIR="$HOME/var_settings"
export $SETTINGS_DIR="$HOME/settings"

# -----------------------------------------------------------------------------

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

export APPDATA="$HOME/.config"
mkdir -p "$APPDATA"
export XDG_CONFIG_HOME="$APPDATA"

export LOCALAPPDATA="$HOME/.local/share"
mkdir -p "$LOCALAPPDATA"
export XDG_DATA_HOME="$LOCALAPPDATA"

export XDG_CACHE_HOME="$HOME/.cache"
mkdir -p "$XDG_CACHE_HOME"

export TMP="$HOME/tmp"
export TEMP="$HOME/tmp"
mkdir -p "$TMP"

mkdir -p "$HOME/.ssh"

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
