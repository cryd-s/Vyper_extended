# Basics - Backups

## Basics - Automatisches Backupsystem und Verwaltung mit Web-UI auf diverse Zielsysteme wie NAS, S3, Cloudstorage, SFTP, WebDAV etc

Wir:
- installieren Docker und docker-compose zur Verwaltung der Applikationen
- starten die Applikationen als Container in Docker
- Portainer: Zur Verwaltung der Docker Container, zum prüfen ob diese laufen, zum einsehen der Logs, zum Neustarten der Container etc
- Watchtower: Um die Container ohne weitere manuelle Arbeiten aktuell zu halten (automatische Updates)
- Duplicati: Das eigentliche Backup Programm

### <u>Setup Script laden</u>    

```
wget https://raw.githubusercontent.com/cryd-s/Vyper_extended/main/Scripts/setup_backupsystem.sh -P ~/scripts/
```

### <u>Script ausführbar machen</u>  
  
```
chmod +x ~/scripts/setup_backupsystem.sh
```

### <u>Starte das Script</u>

```
~/scripts/setup_backupsystem.sh
```

### <u>Einrichtung</u>

Wie auch für Klipper selber, gibt es für Portainer und Duplicati nun jeweils eine weitere Weboberfläche, die wir über entsprechende Ports erreichen.

- Portainer: <Raspberry-IP>:9000
- Duplicati: <Raspberry-IP>:8200

Portainer:

Nach Aufruf der Oberfläche, sucht euch einen Benutzernamen und Passwort aus und klickt auf "Create User".
Klickt nun oben links auf "Home" und ihr seht relativ mittig, dass es das Environment "local" bereits gibt mit den 3 Containern Portainer, Watchtower und Duplicati die das Script vorbereitet hat.

Duplicati:

Nach Aufruf kommt die kleine Einblendung "First run setup". Ich persönlich nehme hier "No, my machine has only a single account". Wenn du hier ebenfalls eine Loginmaske haben möchtest, wählst du natürlich "Yes" und folgst den Anweisungen.
Anschließend können wir unseren Backup-Task anlegen. "Sicherung Hinzufügen" - "Weiter" - Name und bei Bedarf Verschlüsselung - "Weiter" - euer Ziel "Speichertyp" - "Weiter" - "Quell-Daten" Computer/source/pi und entweder alles oder spezifisch die Konfigurationsordner auswählen - "Weiter" - "Zeitplan" ganz wie ihr wollt - "Weiter" - wichtig nun bei "Allgemeine Einstellungen" die "Sicherungsaufbewahrung" so einzustellen wie es auf das Ziel passt. Ich persönlich bin allgemein ein riesen Freund von "Intelligente Sicherungsaufbewahrung". Aber auch andere Optionen hätten hier durchaus Sinn, je nach dem wie oft ihr an euren Konfigurationen Anpassungen macht.

## Basics - Automatisches Backup-Script für die gesamte Festplatte/SD-Karte auf Netzwerkspeicher

### <u>Bevorzugt und der einfachheithalber als root auszuführen! Das Backup wird ohne Root-Rechte nicht durchführbar sein.</u>

```
sudo -i
```

### <u>Backup Script laden</u>    
      
```
wget https://raw.githubusercontent.com/cryd-s/Vyper_extended/main/Scripts/image_backup.sh -P ~/scripts/
```

### <u>Script ausführbar machen</u>  
  
```
chmod +x ~/scripts/image_backup.sh
```

### <u>Script anpassen</u>

```
nano ~/scripts/image_backup.sh
```

Fologend die Variablen die es zu befüllen gilt.

- `MOUNT` | Die Daten zum NAS-Share
- `COUNT` | Die Anzahl der zu behaltenen Image-Backups (automatisches löschen älterer Backups)
- `USER` & `PASSWORD` | Die Login Daten zum NAS-Share

```
MOUNT="//<IP>/<Pfad>"
COUNT=5
USER="<USER>"
PASSWORD="<PASSWORD>"
```

### <u>Backup Zeit einstellen</u> 

```
crontab -e
```

Startet ihr den Pi regelmäßig neu, z.B. täglich (auch mehrfach), können wir im Crontab einstellen, das Backup direkt nach dem hochfahren zu starten. Es wird allerdings nicht mehr als 1 Backup pro Tag durchgeführt!

```
@reboot /root/scripts/image_backup.sh
```

Ansonsten geht natürlich auch die klassische Zeitdefinition.
https://en.wikipedia.org/wiki/Cron

```
0 5 * * * /root/scripts/image_backup.sh
```

### <u>FAQ</u>

- Das Backup ist so groß wie die SD-Karte/Festplatte! Sorgt für ausreichend Speicherplatz und/oder passt den `COUNT` entsprechend an. Eine 200GB SD-Karte verbraucht `COUNT` x 200GB auf dem NAS.
- Es wird nicht mehr als ein Backup pro Tag gemacht, auch wenn ihr mit `@reboot` 20 Mal an einem Tag neustartet.
- Lasst den Pi lange genug laufen wenn ihr wisst, dass er gerade das Backup macht. Bei einer 200GB SD-Karte kann es bis zu wenige Stunden dauern!

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
cd ~ && wget https://raw.githubusercontent.com/cryd-s/Vyper_extended/main/Scripts/network_backup.sh -P ~/scripts/
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
