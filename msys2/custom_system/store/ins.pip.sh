#!/bin/bash

if [ ! -d "$VAR_APPS_DIR/python" ]; then
    echo "Python embeddable package not found at $VAR_APPS_DIR/python"
    exit 1
fi

PTH_FILE=$(find "$VAR_APPS_DIR/python" -name "python*._pth" | head -1)
if [ -z "$PTH_FILE" ]; then
    echo "No ._pth file found in $VAR_APPS_DIR/python"
    exit 1
fi

sed -i 's/^#import site/import site/' "$PTH_FILE"

curl -o "$TMP/get-pip.py" https://bootstrap.pypa.io/get-pip.py

"$VAR_APPS_DIR/python/python.exe" "$TMP/get-pip.py"