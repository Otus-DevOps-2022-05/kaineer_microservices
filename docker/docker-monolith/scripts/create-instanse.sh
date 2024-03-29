yc compute instance create \
  --name docker-host \
  --zone ru-central1-a \
  --network-interface subnet-name=reddit-app-subnet,nat-ip-version=ipv4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1804-lts,size=15 \
  --ssh-key ~/.ssh/appuser.pub
