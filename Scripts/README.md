# Basics - Backups

## Basics - Automatisches Backup-Script für Klipper-Konfigurationsdateien auf FritzNAS
  
### <u>Fritzbox Benutzer anlegen</u>
- Auf Fritzbox-Oberfläche einloggen
- System/FRITZ!Box-Benutzer anlegen (Zugang zu NAS Inhalten, alle Lesen und Schreiben) 
  
### <u>FritzNAS Ordner anlegen</u>
- FitzBox-Nas anklicken und auf USB Stick verbinden
- Ordner "klipper_backup" anlegen

### <u>Windows mit Ordner verbinden</u>
  - Windowstaste + \\<IP> (Benutzer+Kennwort eingeben)
  - Dieser PC "Netzwerkadresse hinzufügen"
  - Suchen und einrichten


### <u>Backup Script laden</u>    

```
cd ~ && wget https://raw.githubusercontent.com/cryd-s/Vyper_extended/main/Backup/network_backup.sh -P ~/scripts/
```

### <u>Script ausführbar machen</u>  

```
chmod +x ~/scripts/network_backup.sh
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
echo "//<IP>/<Pfad> /mnt/backup_fritz cifs uid=$(id -u pi),gid=$(id -g pi),credentials=/home/pi/.smb/credentials_fritz.txt 0 0" | sudo tee -a /etc/fstab >/dev/null
```

_Beispiel:_    
- echo "//192.168.178.1/fritz.nas/USB-SanDisk3-2Gen1-01/klipper_backup /mnt/backup_fritz cifs uid=$(id -u pi),gid=$(id -g pi),credentials=/home/pi/.smb/credentials_fritz.txt 0 0" | sudo tee -a /etc/fstab >/dev/null


### <u>Backup Zeit einstellen</u> 

```
crontab -e
```

```
30 2 * * * /home/pi/scripts/network_backup.sh
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
