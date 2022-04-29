#!/bin/bash

cd ~

docker-compose -f docker-compose/duplicati/docker-compose.yml down
docker-compose -f docker-compose/watchtower/docker-compose.yml down

sudo apt remove --purge -y docker-engine docker docker.io docker-ce docker-ce-cli containerd.io containerd runc
sudo apt autoremove -y
sudo apt autoclean

sudo pip3 uninstall docker-compose -y

rm -rf docker-compose
rm -rf /home/duplicati

sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
