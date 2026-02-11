# -----------------------------------------------------------------------------

export ROOT_DIR="$HOME"
export SYSTEM_DIR="$HOME/s7sys/system"
export STORE_DIR="$HOME/s7sys/store"
export VAR_SETTINGS_DIR="$HOME/var_settings"
export SETTINGS_DIR="$HOME/settings"

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

export XDG_CONFIG_HOME="$HOME/.config"
mkdir -p "$XDG_CONFIG_HOME"

export XDG_DATA_HOME="$HOME/.local/share"
mkdir -p "$XDG_DATA_HOME"

export XDG_CACHE_HOME="$HOME/.cache"
mkdir -p "$XDG_CACHE_HOME"

export XDG_STATE_HOME="$HOME/.local/state"
mkdir -p "$XDG_STATE_HOME"

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
find "$SETTINGS_DIR/scripts" -type f -name "*.sh" -exec chmod +x {} +
find "$VAR_SETTINGS_DIR/scripts" -type f -name "*.sh" -exec chmod +x {} +
find "$SYSTEM_DIR/scripts" -type f -name "*.sh" -exec chmod +x {} +
find "$STORE_DIR" -type f -name "*.sh" -exec chmod +x {} +

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
