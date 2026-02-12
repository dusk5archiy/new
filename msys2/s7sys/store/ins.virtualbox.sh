#!/bin/bash

URL="https://download.virtualbox.org/virtualbox/7.2.4/VirtualBox-7.2.4-170995-Win.exe"
INSTALLER="$TMP/virtualbox.exe"

if [ -f "$INSTALLER" ]; then
  echo "Using existing installer..."
else
  echo "Downloading installer..."
  curl -L -o "$INSTALLER" "$URL"
fi

if [ ! -f "$INSTALLER" ]; then
  echo "Error: Installer not found."
  exit 1
fi

INSTALLER_WIN="$(cygpath -w "$INSTALLER")"

INSTALL_DIR="$VAR_APPS_DIR/virtualbox"
INSTALL_DIR_WIN="$(cygpath -w "$INSTALL_DIR")"

mkdir -p "$INSTALL_DIR"

cmd //c $INSTALLER_WIN --silent -msiparams \
  VBOX_INSTALLDESKTOPSHORTCUT=0 \
  VBOX_INSTALLQUICKLAUNCHSHORTCUT=0 \
  VBOX_REGISTERFILEEXTENSIONS=0 \
  VBOX_START=0
