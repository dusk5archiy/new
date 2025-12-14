source $SYSTEM_DIR/assets/etc/profile

for file in "$SYSTEM_DIR/startup"/*.sh; do
  [[ -f "$file" ]] && source "$file"
done

current_dir="$(pwd)"
if [[ $current_dir == "/$SYSTEM_DRIVE_LETTER/Users/$(/usr/bin/whoami)" ]]; then
  cd $DESKTOP
fi
