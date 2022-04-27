# Optionale Backup Möglichkeiten

## OPTIONAL - Automatisches Backup-Script für die gesamte SD-Karte auf NAS

### <u>Bitte als root ausführen! Das Backup wird ohne Root-Rechte nicht durchführbar sein.</u>

<u>Alle Befehle sind im SSH-Client Eurer Wahl einzugeben, wie z.B. Putty.</u>

```
sudo -i
```

### <u>Backup Script laden</u>    
      
```
wget https://raw.githubusercontent.com/cryd-s/Vyper_extended/main/Backup/Optional/image_backup.sh -P ~/scripts/
```

### <u>Script ausführbar machen</u>  
  
```
chmod +x ~/scripts/image_backup.sh
```

### <u>Script anpassen</u>

```
nano ~/scripts/image_backup.sh
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
MOUNT="//192.168.1.10/backup/raspi/image"
COUNT=5
USER="anon"
PASSWORD="krasssicher123"
```

### <u>Backup starten</u> 

Bitte das Backup nur bei Bedarf manuell im Leerlauf starten. Das Backup der gesamten SD Karte im laufenden Betrieb ist nicht risikolos!
Es bedarf keiner regelmäßigen Wiederholung, da die Konfigurationen bevorzugt über Duplicati zu sichern sind und auch kein älteres Image kein Beinbruch ist. Die Updates können dann wie gewohnt über die Klipper-UI gezogen werden und die Konfigurationen mit Duplicati wiederhergestellt werden.

```
./scripts/image_backup.sh
```

### <u>FAQ</u>

- Das Backup ist so groß wie die SD-Karte! Sorgt für ausreichend Speicherplatz und/oder passt den `COUNT` entsprechend an. Eine 200GB SD-Karte verbraucht `COUNT` x 200GB auf dem NAS.
- Es wird nicht mehr als ein Backup pro Tag gemacht, auch wenn ihr es 20 Mal an einem Tag ausführt.
- Lasst den Pi lange genug laufen wenn ihr wisst, dass er gerade das Backup macht. Bei einer 200GB SD-Karte kann es bis zu wenige Stunden dauern!
