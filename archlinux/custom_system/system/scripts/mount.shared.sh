read -p 'Enter username: ' username_
read -s -p 'Enter password: ' password_
MOUNT_FOLDER='\mnt\shared'
SHARED_ADDRESS="\\$(ip route show default | awk '/default/ {print $3}')\shared"
sudo mount -t cifs $SHARED_ADDRESS $MOUNT_FOLDER -o user=$(echo $username_),password=$(echo $password_),uid=$(id -u),gid=$(id -g),forceuid,forcegid,file_mode=0777,dir_mode=0777
