rm -rf "$HOME/custom_system"
mkdir -p "$HOME/custom_system"
cp -r "./archlinux"/* "$HOME/"
find "$HOME/custom_system/store" -type f -name "*.sh" -exec chmod +x {} +
