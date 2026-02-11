app_name=$1
if [[ -z "$app_name" ]]; then
  read -p "Enter app name: " app_name
fi

load.env.app.sh $app_name
ins.package.app.sh $app_name
load.config.app.sh $app_name
