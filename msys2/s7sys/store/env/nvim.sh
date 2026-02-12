export NVIM_CONFIG_DIR="$XDG_CONFIG_HOME/nvim"
mkdir -p "$NVIM_CONFIG_DIR"

export CUSTOM_NVIM_CONFIG_DIR="$ROOT_DIR/settings/config/nvim"
mkdir -p "$CUSTOM_NVIM_CONFIG_DIR"

export W_CUSTOM_NVIM_CONFIG_DIR="$(/usr/bin/cygpath -w "$CUSTOM_NVIM_CONFIG_DIR")"
