# -----------------------------------------------------------------------------

export SYSTEM_DRIVE_LETTER=$(echo $SYSTEMDRIVE | /usr/bin/cut -c1 | /usr/bin/tr '[:upper:]' '[:lower:]')
export HOME_DRIVE_LETTER=$(/usr/bin/cygpath -w / | /usr/bin/cut -c1 | /usr/bin/tr '[:upper:]' '[:lower:]')

# -----------------------------------------------------------------------------

f_folder() {
  /usr/bin/mkdir -p "$APPS_DIR" \
    "$VAR_APPS_DIR" \
    "$VAR_SETTINGS_DIR" \
    "$VAR_SETTINGS_DIR/env" \
    "$VAR_SETTINGS_DIR/init" \
    "$VAR_SETTINGS_DIR/path" \
    "$VAR_SETTINGS_DIR/scripts" \
    "$SETTINGS_DIR" \
    "$SETTINGS_DIR/config" \
    "$SETTINGS_DIR/env" \
    "$SETTINGS_DIR/init" \
    "$SETTINGS_DIR/path" \
    "$SETTINGS_DIR/scripts"
}

# -----------------------------------------------------------------------------

f_ext_1() {
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
}

# -----------------------------------------------------------------------------

f_etc() {
  source $SYSTEM_DIR/assets/etc/profile
}

# -----------------------------------------------------------------------------

f_const_env() {
  export APPDATA=$(cygpath -w "$HOME/AppData/Roaming")
  export LOCALAPPDATA=$(cygpath -w "$HOME/AppData/Local")
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_DATA_HOME="$HOME/.local/share"
  export XDG_CACHE_HOME="$HOME/.cache"
  export XDG_STATE_HOME="$HOME/.local/state"
  export TMP="$HOME/tmp"
  export TEMP="$HOME/tmp"
  export ORIGINAL_USERPROFILE="/$SYSTEM_DRIVE_LETTER/Users/$(/usr/bin/whoami)"
  export USERPROFILE=$(cygpath -w "$HOME/profile")
  export DESKTOP="$USERPROFILE\Desktop"
  export DOCUMENTS="$USERPROFILE\Documents"
  export ORIGINAL_HOME="/home/$(/usr/bin/whoami)"
}

f_const_init() {
  mkdir -p "$HOME/AppData" \
    "$APPDATA" \
    "$LOCALAPPDATA" \
    "$XDG_CONFIG_HOME" \
    "$XDG_DATA_HOME" \
    "$XDG_CACHE_HOME" \
    "$XDG_STATE_HOME" \
    "$TMP" \
    "$USERPROFILE" \
    "$DESKTOP" \
    "$DOCUMENTS" \
    "$ORIGINAL_HOME" \
    "$ORIGINAL_HOME/.ssh"
  touch "$ORIGINAL_HOME/.ssh/authorized_keys"
}

# -----------------------------------------------------------------------------

f_env() {
  for file in "$SYSTEM_DIR/env"/*.sh; do
    [[ -f "$file" ]] && source "$file"
  done

  for file in "$VAR_SETTINGS_DIR/env"/*.sh; do
    [[ -f "$file" ]] && source "$file"
  done

  for file in "$SETTINGS_DIR/env"/*.sh; do
    [[ -f "$file" ]] && source "$file"
  done
}

f_init() {
  for file in "$SYSTEM_DIR/init"/*.sh; do
    [[ -f "$file" ]] && source "$file"
  done

  for file in "$VAR_SETTINGS_DIR/init"/*.sh; do
    [[ -f "$file" ]] && source "$file"
  done

  for file in "$SETTINGS_DIR/init"/*.sh; do
    [[ -f "$file" ]] && source "$file"
  done
}

f_path() {
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
}

# -----------------------------------------------------------------------------

f_ext_2() {
  if [[ ! -z "$EXTERNAL_PATH" ]]; then
    export PATH="$EXTERNAL_PATH:$PATH"
  fi
  unset EXTERNAL_PATH
}

# -----------------------------------------------------------------------------

f_final() {
  current_dir="$(pwd)"
  if [[ $current_dir == "/$SYSTEM_DRIVE_LETTER/Users/$(/usr/bin/whoami)" ]]; then
    cd $DESKTOP
  fi

}

# -----------------------------------------------------------------------------

f_alias() {
  alias ls='ls --color=tty'
}

# -----------------------------------------------------------------------------

f() {
  f_folder
  f_ext_1
  f_etc
  f_const_env
  f_const_init
  f_env
  f_init
  f_path
  f_ext_2
  f_alias
}

time f

# -----------------------------------------------------------------------------
