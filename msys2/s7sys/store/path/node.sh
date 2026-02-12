for dir in $VAR_APPS_DIR/node/*/; do
  dir=${dir%/}
  if [ -d "$dir" ]; then
    addpath "$dir"
  fi
done
