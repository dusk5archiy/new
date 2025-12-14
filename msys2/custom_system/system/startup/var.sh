mkdir -p $APPS_DIR
mkdir -p $CUSTOM_SETTINGS_DIR/env
mkdir -p $CUSTOM_SETTINGS_DIR/init
mkdir -p $CUSTOM_SETTINGS_DIR/path
mkdir -p $CUSTOM_SETTINGS_DIR/scripts

for file in "$SYSTEM_DIR/env"/*.sh; do
  [[ -f "$file" ]] && source "$file"
done

for file in "$CUSTOM_SETTINGS_DIR/env"/*.sh; do
  [[ -f "$file" ]] && source "$file"
done

for file in "$SYSTEM_DIR/init"/*.sh; do
  [[ -f "$file" ]] && source "$file"
done

for file in "$CUSTOM_SETTINGS_DIR/init"/*.sh; do
  [[ -f "$file" ]] && source "$file"
done

CUSTOM_PATH="$CUSTOM_SETTINGS_DIR/scripts:$SYSTEM_DIR/scripts"

addpath() {
  local dir="$1"
  CUSTOM_PATH="$CUSTOM_PATH:$dir"
}

for file in "$SYSTEM_DIR/path"/*.sh; do
  [[ -f "$file" ]] && source "$file"
done

for file in "$CUSTOM_SETTINGS_DIR/path"/*.sh; do
  [[ -f "$file" ]] && source "$file"
done

export PATH="$CUSTOM_PATH:$PATH"

unset addpath
unset CUSTOM_PATH
