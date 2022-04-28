# Alternative Backup Möglichkeit

## OPTIONAL - Automatisches Backup-Script auf NAS für die Klipper Konfigurationen

<u>Alle Befehle sind im SSH-Client Eurer Wahl einzugeben, wie z.B. Putty.</u>

### <u>Backup Script laden</u>    
      
```
wget https://raw.githubusercontent.com/cryd-s/Vyper_extended/main/Backup/Alternativ/config_backup.sh -P ~/scripts/
```

### <u>Script ausführbar machen</u>  
  
```
chmod +x ~/scripts/config_backup.sh
```

### <u>Script anpassen</u>

```
nano ~/scripts/config_backup.sh
```

Folgend die Variablen die es zu befüllen gilt.

- `MOUNT` | Die Daten zum NAS-Share
- `COUNT` | Die Anzahl der zu behaltenen Image-Backups (automatisches löschen älterer Backups)
- `USER` & `PASSWORD` | Die Login Daten zum NAS-Share

```
MOUNT="//<IP>/<Pfad>"
COUNT=5
USER="<USER>"
PASSWORD="<PASSWORD>"
```

<u>Beispiel:</u>

```
MOUNT="//192.168.1.10/backup/raspi/config"
COUNT=5
USER="anon"
PASSWORD="krasssicher123"
```

### <u>Backup starten</u> 

```
./scripts/config_backup.sh
```


