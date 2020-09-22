#!/bin/bash

# Create instance
echo "Create instanse \"Reddit-app\""
yc compute instance create \
--name reddit-app \
--hostname reddit-app \
--memory=2  \
--create-boot-disk name=reddit-full,image-id=fd81hkmjjestvka2kcve \
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
--metadata serial-port-enable=1 --ssh-key ~/.ssh/appuser.pub
