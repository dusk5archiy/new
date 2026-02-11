app_name="$1"
if [[ -z "$app_name" ]]; then
  read -p "Enter app name: " app_name
fi
# sudo pacman -S --needed --noconfirm - <$filename

(
  . /etc/os-release
  filename="$STORE_DIR/assets/$ID.$app_name.sh"
  if [ -f "$filename" ]; then
    . $filename
  fi
)
