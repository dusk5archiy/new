#!/bin/bash

if ! net session >/dev/null 2>&1; then
  echo "This script must be run as administrator."
  exit 1
fi

echo "Searching for Hyper-V packages..."

find "$SYSTEMROOT\\servicing\\Packages" -name "*Hyper-V*.mum" 2>/dev/null >"$TMP/hv.txt"

while IFS= read -r package || [ -n "$package" ]; do
  if [ -n "$package" ]; then
    echo "Installing: $(basename "$package")"
    win_package="$SYSTEMROOT\\servicing\\Packages\\$(basename "$package")"
    dism.exe //Online //NoRestart //Add-Package:"$win_package"
  fi
done <"$TMP/hv.txt"

rm -f "$TMP/hv.txt"

echo "Hyper-V packages installation complete."
echo "Open 'Turn Windows features on or off' to enable Hyper-V."
