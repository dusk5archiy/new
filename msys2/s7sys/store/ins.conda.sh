#!/bin/bash

URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe"
INSTALLER="$TMP/miniconda.exe"

if [ -f "$INSTALLER" ]; then
  echo "Using existing Miniconda installer..."
else
  echo "Downloading Miniconda installer..."
  curl -L -o "$INSTALLER" "$URL"
fi

if [ ! -f "$INSTALLER" ]; then
  echo "Error: Installer not found."
  exit 1
fi

$INSTALLER //NoRegistry=1 //AddToPath=0 //NoShortcuts=1 //RegisterPython=0 //S
