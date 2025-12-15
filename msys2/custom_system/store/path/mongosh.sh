for dir in $APPS_DIR/mongosh/*/; do
  dir=${dir%/}
  if [ -d "$dir" ]; then
    addpath "$dir/bin"
  fi
done
