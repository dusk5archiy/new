read -p "Enter app name: " app_name
rm -f "$CUSTOM_SETTINGS_DIR/path/$app_name.*"
cp "$STORE_DIR/path/$app_name."* "$CUSTOM_SETTINGS_DIR/path/"
