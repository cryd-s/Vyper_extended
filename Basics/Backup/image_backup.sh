#!/bin/bash

# Variables

DIR="/mnt/backup"
MOUNT="//<IP>/<Pfad>"
COUNT=5
NAME="sd_backup"
DATE="$(date +%Y%m%d)"
USER="<USER>"
PASSWORD="<PASSWORD>"

# Preparation

if [ ! -d "${DIR}" ]; then
  mkdir ${DIR}
fi

if grep -q "$DATE" /root/last_backup; then
  exit 1
fi

# Backup

mount -t cifs -o user=${USER},password=${PASSWORD} ${MOUNT} ${DIR}

if mountpoint -q ${DIR}; then
  dd if=/dev/mmcblk0 of=${DIR}/${NAME}_$(date +%Y%m%d).img bs=1MB
  echo $(date +%Y%m%d) > /root/last_backup
  pushd ${DIR}; ls -tr ${DIR}/${NAME}* | head -n -${COUNT} | xargs -r rm; popd
  umount /mnt/backup
fi
