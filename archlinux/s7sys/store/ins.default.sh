(
  . /etc/os-release
  filename="$STORE_DIR/assets/$ID._update.sh"
  if [ -f "$filename" ]; then
    . $filename
  fi
)

apps=("git" "ssh" "nvim" "yazi")

for app in "${apps[@]}"; do
  . ins.app.sh $app
done

ins.lazyvim.sh
