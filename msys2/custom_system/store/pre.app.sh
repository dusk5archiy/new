read -p "Enter app name: " app_name
rm -f "$VAR_SETTINGS_DIR/path/$app_name.*"
cp "$STORE_DIR/path/$app_name."* "$VAR_SETTINGS_DIR/path/"
