read -p "Enter your email: " email
ssh-keygen -t ed25519 -f "$HOME/.ssh/id_ed25519" -C "$email" -N "" # -N "" means empty passphrase
