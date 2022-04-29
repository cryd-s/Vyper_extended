# Aktuelles Backup System

## AKTUELL - Automatisches Backupsystem und Verwaltung mit Web-UI auf diverse Zielsysteme wie Google Drive, Dropbox, NAS, SFTP, WebDAV und weitere

Wir:
- installieren Docker und docker-compose zur Verwaltung der Applikationen
- starten die Applikationen als Container in Docker
- Watchtower: Um die Container ohne weitere manuelle Arbeiten aktuell zu halten (automatische Updates)
- Duplicati: Das eigentliche Backup Programm

<u>Alle Befehle sind im SSH-Client Eurer Wahl einzugeben, wie z.B. Putty.</u>

### <u>Setup Script laden</u>    

```
wget https://raw.githubusercontent.com/cryd-s/Vyper_extended/main/Backup/Aktuell/setup_backupsystem.sh -P ~/scripts/
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

**Duplicati:**

1. Im Browser "http://Raspberry-IP:8200" aufrufen wie z.B. http://192.168.1.10:8200
   - Nach Aufruf kommt die kleine Einblendung "First run setup".
     - Ich persönlich nehme hier "No, my machine has only a single account". Wenn du hier ebenfalls eine Loginmaske haben möchtest, wählst du natürlich "Yes" und folgst den Anweisungen.
   - Anschließend können wir unseren Backup-Task anlegen.
   - "Sicherung Hinzufügen"
   - "Weiter"
   - Name und bei Bedarf Verschlüsselung
   - "Weiter"
   - Euer Ziel "Speichertyp", bitte wählt einen Remote Storage wie Cloud oder NAS. Ein lokaler Ordner kann ohne Anpassung nicht verwendet werden! Eure Backups werden auf kurz oder lang verschwinden!
   - "Weiter"
   - "Quell-Daten" `Computer/source/pi` und entweder alles oder spezifisch die Konfigurationsordner auswählen
   - "Weiter"
   - "Zeitplan" ganz wie ihr wollt
   - "Weiter"
   - **Wichtig** nun bei "Allgemeine Einstellungen" die "Sicherungsaufbewahrung" so einzustellen wie es auf das Ziel passt. Ich persönlich bin allgemein ein riesen Freund von "Intelligente Sicherungsaufbewahrung". Aber auch andere Optionen hätten hier durchaus Sinn, je nach dem wie oft ihr an euren Konfigurationen Anpassungen macht.

Am Ende sehen wir den Backup-Plan auf dem "Home"-Bildschirm. Mit einem Klick auf den Namen oder den Pfeil daneben bekommen wir diverse Auswahlmöglichkeiten. Klickt unter `Konfiguration:` auf `Exportieren` und lasst `als Datei` und bei Bedarf auch `passwort exportieren` ausgewählt. Anschließend mit `Exportieren` die Konfiguration auf dem PC speichern.

## Restore

TBD


## Uninstall

### <u>Script laden</u>    

```
wget https://raw.githubusercontent.com/cryd-s/Vyper_extended/main/Backup/Aktuell/uninstall.sh -P ~/scripts/
```

### <u>Script ausführbar machen</u>  
  
```
chmod +x ~/scripts/uninstall.sh
```

### <u>Script ausführen</u>

```
~/scripts/uninstall.sh
```
