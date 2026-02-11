app_name="$1"
if [[ -z "$app_name" ]]; then
  read -p "Enter app name: " app_name
fi

filename="$STORE_DIR/assets/ins.$app_name.txt"
if [ -f "$filename" ]; then
  sudo pacman -S --needed --noconfirm - <$filename
fi
