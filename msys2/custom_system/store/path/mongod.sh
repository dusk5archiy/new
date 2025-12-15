for dir in $APPS_DIR/mongod/*/; do
  dir=${dir%/}
  if [ -d "$dir" ]; then
    addpath "$dir/bin"
  fi
done
