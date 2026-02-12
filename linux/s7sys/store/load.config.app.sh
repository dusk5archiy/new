app_name="$1"
if [[ -z "$app_name" ]]; then
  read -p "Enter app name: " app_name
fi

d="$STORE_DIR/config/$app_name"
if [ -d "$d" ]; then
  rm -rf "$SETTINGS_DIR/config/$app_name"
  mkdir -p "$SETTINGS_DIR/config/$app_name"
  cp -r "$STORE_DIR/config/$app_name"/* "$SETTINGS_DIR/config/$app_name/"
fi
