(
  . /etc/os-release
  filename="$STORE_DIR/assets/$ID._update.sh"
  if [ -f "$filename" ]; then
    . $filename
  fi

  # ---------------------------------------------------------------------------

  apps=()

  case $ID in
  arch)
    apps=("git" "ssh" "nvim" "yazi")
    ;;
  ubuntu)
    apps=("git" "ssh" "nvim")
    ;;
  *)
    apps=()
    ;;
  esac

  for app in "${apps[@]}"; do
    . ins.app.sh $app
  done

  ins.lazyvim.sh
)
