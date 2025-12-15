for dir in $APPS_DIR/mongodbtools/*/; do
  dir=${dir%/}
  if [ -d "$dir" ]; then
    addpath "$dir/bin"
  fi
done
