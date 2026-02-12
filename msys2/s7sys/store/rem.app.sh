read -p "Enter app name: " app_name
rm -f "$VAR_SETTINGS_DIR/env/$app_name."*
rm -f "$VAR_SETTINGS_DIR/init/$app_name."*
rm -f "$VAR_SETTINGS_DIR/path/$app_name."*
rm -f "$VAR_SETTINGS_DIR/scripts/$app_name."*
