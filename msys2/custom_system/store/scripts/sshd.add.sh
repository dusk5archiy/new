read -p "Enter a public key: " public_key_
echo "$public_key_" >>"$ORIGINAL_HOME/.ssh/authorized_keys"
