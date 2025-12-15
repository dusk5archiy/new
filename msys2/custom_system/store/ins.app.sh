read -p "Enter app name: " app_name
filename="$STORE_DIR/assets/ins.$app_name.txt"
if [ -f "$filename" ]; then
  pacman -S --needed --noconfirm - <$filename
fi
