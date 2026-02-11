apps=("git" "ssh" "nvim" "yazi")

for app in "${apps[@]}"; do
  ins.app.sh $app
done

ins.lazyvim.sh
