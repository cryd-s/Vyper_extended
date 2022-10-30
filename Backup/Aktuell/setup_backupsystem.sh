#!/bin/bash

# Variables

IFS=","
COMPOSE_DIR=$HOME/docker-compose
SERVICES=watchtower,duplicati
#portainer

# Install Docker

if [[ ! -x "$(command -v docker)" ]]; then
  sudo apt update && sudo apt -y upgrade
  curl -sSL https://get.docker.com | sudo sh
  sudo usermod -aG docker $USER
else
  echo Docker already installed
fi

# Install docker-compose

if [[ ! -f /usr/bin/docker-compose && ! -f /usr/local/bin/docker-compose ]]; then
  sudo apt update && sudo apt -y upgrade
  sudo apt install -y libffi-dev libssl-dev python3-dev python3 python3-pip 
  sudo apt install -y docker-compose
  sudo apt update && sudo apt -y upgrade
#  sudo pip3 install docker-compose
else
  echo docker-compose already installed
fi

# Deploy applications

for i in $SERVICES; do
  if [[ ! -d $COMPOSE_DIR/$i ]]; then
    mkdir -p $COMPOSE_DIR/$i
  fi
  if [[ ! -f $COMPOSE_DIR/$i/docker-compose.yml ]]; then
    if [[ "$i" == "duplicati" ]]; then
      cat << EOF > $COMPOSE_DIR/$i/docker-compose.yml
services:
    image: duplicati/duplicati
    restart: unless-stopped
    container_name: duplicati
    volumes:
      - /home/duplicati:/data
      - /home/pi:/source/pi
    ports:
      - 8200:8200
EOF
    elif [[ "$i" == "watchtower" ]]; then
      cat << EOF > $COMPOSE_DIR/$i/docker-compose.yml
services:
    image: containrrr/watchtower
    restart: unless-stopped
    container_name: watchtower
    command: watchtower portainer duplicati --schedule '0 6 * * * *'  --cleanup --include-stopped --revive-stopped
    environment:
      - TZ=Europe/Berlin
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
EOF
    elif [[ "$i" == "portainer" ]]; then
      cat << EOF > $COMPOSE_DIR/$i/docker-compose.yml
services:
    image: portainer/portainer-ce
    restart: unless-stopped
    container_name: portainer
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /home/portainer:/data
    ports:
      - 9000:9000
EOF
    fi
  fi
  sudo docker-compose -f $COMPOSE_DIR/$i/docker-compose.yml up -d
done
