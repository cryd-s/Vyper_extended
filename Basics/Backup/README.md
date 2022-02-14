# Basics - Automatisches Backup  
  
### <u>Fritzbox Benutzer anlegen</u>
- Auf Fritzbox-Oberfläche einloggen
- System/FRITZ!Box-Benutzer anlegen (Zugang zu NAS INhalten, alle Lesen und Schreiben) 
  
### <u>FritzNAS Ordner anlegen</u>
- FitzBox-Nas anklicken und auf USB Stick verbinden
- Ornder "klipper_Backup" anlegen

### <u>Windows mit Ordner verbinden</u>
  - Windowstaste + \\<IP> (Benutzer+Kennwort eingeben)
  - Dieser PC "Netzwerkadresse hinzufügen"
  - Suchen und einrichten


### <u>Backup script laden</u>    
      
```
sudo apt install git
```
```
mkdir -p /home/pi/Github
```
```
cd /home/pi/Github
```
```
git clone https://github.com/cryd-s/Vyper_extended.git  
```  
```
mkdir -p /home/pi/klipper_config/Scripts
```
```
cp /home/pi/Github/Vyper_extended/Scripts/* /home/pi/klipper_config/Scripts
```  
  
### <u>Scripte ausführbar machen</u>  
  
```
chmod +x /home/pi/klipper_config/Scripts/*
```

### <u>Netzwerkordner einbinden</u> 
```
sudo mkdir /mnt/backup_fritz
```
```
sudo sudo chgrp pi /mnt/backup_fritz && sudo chown pi /mnt/backup_fritz
```
```
mkdir -p ~/.smb
```
```
nano ~/.smb/credentials_fritz.txt
```
```
user=<benutzername>
password=<passwort>
```

### <u>Ornder beim Neustart automatisch einbinden</u> 

```
sudo nano /etc/fstab
```
```
//<IP>/<Pfad> /mnt/backup_fritz cifs uid=pi,credentials=/home/pi/.smb/credentials_fritz.txt 0 0
```
_Beispiel:_    
- //192.168.178.1/fritz.nas/USB-SanDisk3-2Gen1-01/klipper_backup /mnt/backup_fritz cifs uid=pi,credentials=/home/pi/.smb/credentials_fritz.txt 0 0  
  
### <u>Backup Zeit einstellen</u> 

```
sudo nano /etc/crontab
```
```
30 02   * * *   pi      /bin/bash /home/pi/klipper_config/Scripts/networt_backup.sh
```

### <u>KIAUH installieren</u>
```
sudo apt install git
```
```
mkdir -p /home/pi/Github
```
```
cd /home/pi/Github
```
```
git clone https://github.com/th33xitus/kiauh.git 
```
```
cd kiauh
```
```
./kiauh.sh
```
  
### <u>Activation Makro</u>

[gcode_shell_command scrpits_activate_backup]
command: /usr/bin/chmod +x /home/pi/klipper_config/Scripts/backup.sh
verbose: True
[gcode_macro SCRIPTS_ACTIVATE_BACKUP]
gcode:
    RUN_SHELL_COMMAND CMD=scrpits_activate_backup

