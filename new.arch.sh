#!/bin/bash
# git clone https://github.com/dusk5archiy/new
# cd new
# chmod +x new.arch.sh
# ./new.arch.sh

rm -rf "$HOME/s7sys"
cp -r "./linux"/* "$HOME/"

s='. $HOME/s7sys/system/main.sh'
grep -v -F -x "$s" $HOME/.bashrc >$HOME/.bashrc
sudo tee $HOME/.bashrc >>/dev/null <<'EOF'
$s
EOF

echo 'Restart the shell to finish the installation.'
