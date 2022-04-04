# Basics - Automatisches Backup-Script mit FritzNAS
  
### <u>Fritzbox Benutzer anlegen</u>
- Auf Fritzbox-Oberfläche einloggen
- System/FRITZ!Box-Benutzer anlegen (Zugang zu NAS Inhalten, alle Lesen und Schreiben) 
  
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
git clone https://github.com/cryd-s/Vyper_extended.git vyper_extended 
```  

```
cp -R /home/pi/vyper_extended/Scripts /home/pi/klipper_config/
```  
  
### <u>Scripte ausführbar machen</u>  
  
```
chmod +x /home/pi/klipper_config/Scripts/*
```

### <u>Mount vorbereiten</u> 

```
sudo mkdir /mnt/backup_fritz
```

```
sudo chown pi:pi /mnt/backup_fritz
```

```
mkdir ~/.smb
```

```
nano ~/.smb/credentials_fritz.txt
```

```
user=<benutzername>
password=<passwort>
```

### <u>Ordner beim Neustart automatisch einbinden</u> 

```
sudo echo "//<IP>/<Pfad> /mnt/backup_fritz cifs uid=$(id -u pi),gid=$(id -g pi),credentials=/home/pi/.smb/credentials_fritz.txt 0 0" >> /etc/fstab
```

_Beispiel:_    
- sudo echo "//192.168.178.1/fritz.nas/USB-SanDisk3-2Gen1-01/klipper_backup /mnt/backup_fritz cifs uid=$(id -u pi),gid=$(id -g pi),credentials=/home/pi/.smb/credentials_fritz.txt 0 0" >> /etc/fstab
  
### <u>Backup Zeit einstellen</u> 

```
sudo crontab -e
```

```
30 02 * * * /home/pi/klipper_config/Scripts/network_backup.sh
```

### <u>KIAUH installieren</u>

```
sudo apt install git
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

```
[gcode_shell_command script_netbck_activate]
command: /usr/bin/chmod +x /home/pi/klipper_config/Scripts/network_backup.sh
verbose: True
[gcode_macro SCRIPT_ACTIVATE_Network_Backup]
gcode:
    RUN_SHELL_COMMAND CMD=script_netbck_activate
```

```
[gcode_shell_command script_backup_network_backup]
command: bash /home/pi/klipper_config/Scripts/network_backup.sh
verbose: True
[gcode_macro SCRIPT_Backup_Network]
gcode:
    RUN_SHELL_COMMAND CMD=script_backup_network_backup
```

