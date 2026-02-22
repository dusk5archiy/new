#!/bin/bash
# git clone https://github.com/dusk5archiy/new
# cd new
# chmod +x new.arch.sh
# ./new.arch.sh
rm -rf "$HOME/s7sys"
cp -r "./linux"/* "$HOME/"
sudo tee $HOME/.bashrc >/dev/null <<'EOF'
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
. $HOME/s7sys/system/main.sh
EOF

echo 'Restart the shell to finish the installation.'
