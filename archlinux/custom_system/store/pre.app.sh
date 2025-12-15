read -p "Enter app name: " app_name
rm -f "$VAR_SETTINGS_DIR/env/$app_name.*"
rm -f "$VAR_SETTINGS_DIR/init/$app_name.*"
rm -f "$VAR_SETTINGS_DIR/path/$app_name.*"
rm -f "$VAR_SETTINGS_DIR/scripts/$app_name.*"
cp -r "$STORE_DIR/env/$app_name."* "$VAR_SETTINGS_DIR/env/" >/dev/null 2>&1
cp -r "$STORE_DIR/init/$app_name."* "$VAR_SETTINGS_DIR/init/" >/dev/null 2>&1
cp -r "$STORE_DIR/path/$app_name."* "$VAR_SETTINGS_DIR/path/" >/dev/null 2>&1
cp -r "$STORE_DIR/scripts/$app_name."* "$VAR_SETTINGS_DIR/scripts/" >/dev/null 2>&1
