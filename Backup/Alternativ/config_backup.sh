#!/bin/bash

# Variables

# ANPASSEN
MOUNT="//<IP>/<Pfad>"
COUNT=5
USER="<USER>"
PASSWORD="<PASSWORD>"

# IMPORTANT
NAME="config_backup"
DATE="$(date +%Y%m%d)"
DIR="/mnt/config_backup"

# Preparation

if [ ! -d "${DIR}" ]; then
  sudo mkdir ${DIR} && sudo chown $USER:$USER ${DIR}
fi

#if grep -q "$DATE" ~/last_config_backup; then
#  exit 1
#fi

# Backup

cd ~

mount -t cifs -o user=${USER},password=${PASSWORD} ${MOUNT} ${DIR}

if mountpoint -q ${DIR}; then
  tar czf ${DIR}/${NAME}_$(date +%Y%m%d).tar.gz klipper_config
  #echo $(date +%Y%m%d) > ~/last_config_backup
  pushd ${DIR}; ls -tr ${DIR}/${NAME}* | head -n -${COUNT} | xargs -r rm; popd
  umount /mnt/config_backup
fi
