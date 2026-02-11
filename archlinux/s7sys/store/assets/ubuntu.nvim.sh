sudo apt install --no-install-recommends --no-install-suggests -y \
  fd-find fzf gcc git python3 python3-venv ripgrep unzip npm

sudo snap install --classic nvim
sudo snap install --classic node

sudo npm cache clean --force
sudo npm install -g tree-sitter-cli
