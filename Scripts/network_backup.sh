#!/bin/bash
# Cryd Network Backup Tool Version 2
#(Teamwork with realtonysoprano & LeAnon)

#echo "#####################"
echo "#Backup tool started#"
#echo "#####################"

# Settings

Network=True
Local=False
ConfigFolder=True
ConfigFile=True
Timelapse=True
BackupRemove=True
BackupRetention=7

# variables
#backup dirs for network storage
BACKUP_NET_DIR_ROOT=/mnt/backup_fritz/klipper
BACKUP_NET_DIR_CFG=/mnt/backupfritz/klipper/backup$(date +'%Y-%m-%d')
#bacup dirs for local storage
BACKUP_HOME_DIR_ROOT=$HOME/backup/Vyper
BACKUP_HOME_DIR_CFG=$HOME/backup/Vyper/backup_$(date +'%Y-%m-%d')
#config dirs
PRINTER_CFG=$HOME/klipper_config/printer.cfg
KLIPPER_CFG_LOC=$HOME/klipper_config/
#timelapse dir
TIMELAPSE=$HOME/timelapse/

# Network Backups
if [ "$Network" = "True" ]; 
  then
    if [ ! -d $BACKUP_NET_DIR_CFG ]; 
      then
        echo "Create backup directory ..."
        mkdir -p $BACKUP_NET_DIR_CFG && echo -e "Directory created!"
    fi
    if [ "$ConfigFile" = "True" ];
      then
        echo "Timestamp: "$(date)""
        echo "--------------"
        echo "Create Network Backup of printer.cfg ..."
        rsync -avH $PRINTER_CFG $BACKUP_NET_DIR_CFG/printer.cfg.$(date +'%Y-%m-%d-%H-%M') && echo -e "Network Backup of printer.cfg complete!"
      else
        echo  "Backup for printer.cfg set to False! Skipping backup ..."
    fi
    if [ "$ConfigFolder" = "True" ];
      then
        echo "Timestamp: "$(date)""
        echo "--------------"
        echo "Create Network Backup of Config Folder ..."
        rsync -vr $KLIPPER_CFG_LOC $BACKUP_NET_DIR_CFG/klipper_config_$(date +'%Y-%m-%d-%H-%M')/ && echo -e "Network Backup of CFG Folder complete!"
        else
        echo "Backup config directory set to False! Skipping backup ..."
      fi
    if [ "$Timelapse" = "True" ];
      then
        echo "Timestamp: "$(date)""
        echo "--------------"
        echo "Create Network Backup of Timelapse Folder ..."
        rsync -vr $TIMELAPSE $BACKUP_NET_DIR_ROOT/timelapse/ && echo -e "Network Backup of Timelapse Folder complete!"
        else
        echo "Backup timelapse directory set to False! Skipping backup ..."
    fi
  else
    echo "No Network Backup Selected! Skipping backup ..."
fi

# Local Backup
if [ "$Local" = "True" ]; 
  then
    if [ ! -d $BACKUP_HOME_DIR_CFG ]; 
      then
        echo "Create backup directory ..."
        mkdir -p $BACKUP_HOME_DIR_CFG && echo -e "Directory created!"
    fi
    if [ "$ConfigFile" = "True" ];
      then
        echo "Timestamp: "$(date)""
        echo "--------------"
        echo "Create Local Backup of printer.cfg ..."
        rsync -avH $PRINTER_CFG $BACKUP_HOME_DIR_CFG/printer.cfg.$(date +'%Y-%m-%d-%H-%M').backup && echo -e "Local Backup of printer.cfg complete!"
      else
        echo  "No printer.cfg found! Skipping backup ..."
    fi
    if [ "$ConfigFolder" = "True" ];
      then
        echo "Timestamp: "$(date)""
        echo "--------------"
        echo "Create Local Backup of Config Folder ..."
        rsync -vr $klipper_cfg_loc $BACKUP_HOME_DIR_CFG/klipper_config_$(date +'%Y-%m-%d-%H-%M')/ && echo -e "Local Backup of CFG Folder complete!"
        else
        echo "No config directory found! Skipping backup ..."
    fi
  else
    echo "No Local Backup Selected! Skipping backup ..."
fi

#Retention - Remove Backupfiles older then Retention Setting
if [ "$BackupRemove" = "True" ];
  then
      echo "Timestamp: "$(date)""
      echo "--------------"
      echo "Backup Removal active, searching for Backup Files oder then Rention Time ..."
      if [ "$Network" = "True" ]; 
        then
          lines=$(find $BACKUP_NET_DIR_ROOT -type d -name 'backup_*' -mtime +$BackupRetention | wc -l)
          if [ $lines -gt 0 ]; 
            then
              find $BACKUP_NET_DIR_ROOT -type d -name 'backup_*' -mtime +$BackupRetention -exec rm -rf {} +
              echo "Remove of Backupfiles Files completed!"
            else
              echo "No files found older then Retention specified!"
          fi
      fi
      if [ "$Local" = "True" ]; 
        then
          lines=$(find $BACKUP_HOME_DIR_ROOT -type d -name 'backup_*' -mtime +$BackupRetention | wc -l)
          if [ $lines -gt 0 ]; 
            then
              find $BACKUP_HOME_DIR_ROOT -type d -name 'backup_*' -mtime +$BackupRetention -exec rm -rf {} +
              echo "Remove of Backupfiles Files completed!"
            else
              echo "No files found older then Retention specified!"
          fi
      fi
  else
    echo "No Backup Removal selected! Skipping removal..."
fi

echo "######################"
echo "#Backup tool finished#"
echo "######################"
