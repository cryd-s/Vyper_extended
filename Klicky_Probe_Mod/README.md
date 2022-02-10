# Vyper extended - Klicky Probe

### <u>Was ist die Klicky Probe?</u> 

Die Klicky Probe ist ein Mikroschalter, welcher in einem Dock über Magnete vom Kopf aufgenommen wird. Der Schaltkontakt wird ebenfalls über die Magnete hergestellt.
Damit ist ein ZTilt und ein genaues Bed Mesh möglich.

### <u>Vorgehensweise</u>
- Druckteile drucken (unter STLs) / ASA/ABS (Hitzebeständigkeit)
- Leitungen der Druckteile an den vorgesehenen Stellen installieren
- Mikroschalter einsetzen und mit Schrauben fixieren
- Magnete einsetzten (Einpresshilfe, Sekundenkleber)
- Funktionstest des Mikroschalters ohmisch an den Magneten / Leitungen prüfen
- Dock am Heitzbett und Druckkopf befestigen
- Kabel an der LCD Display Anschluss anschließen
- Klicky cfgs laden
- Änderungen in der Printer.cfg (Pin in Probe definieren; safe_z_home ausklammern)
- [include klicky-probe.cfg] in printer.cfg eintragen -> Firmeware restart!
- Funktionstest Mikroschalter (Maschine -> Endschalter)
- Ggf. Prosition Docking Station anpassen in (klicky_variables -> Docking location XYZ)
- Z-Höhe der Nozzle beim Z-Level prüfen (NOTAUS bereit halten)
- Homing mit Probe am Druckkopf testen
- ZTilt testen
- Offset einstellen (Homing, ZTilt , Probe_Calibration) -> Papertest (TESZ z=-1 ; ACCEPT; SAVE_CONFIG)
- Safe Script im nächsten Video

### <u>Klicky Probe Github</u>  
- https://github.com/jlas1/Klicky-Probe

- https://github.com/jlas1/Klicky-Probe/tree/main/CAD 

### <u>Anleitungen auf Englisch</u>
- https://github.com/jlas1/Klicky-Probe/tree/main/Printers/Voron/v1.8_v2.4_Legacy_Trident

### <u>Stückliste</u>

- 1x Mikroschalter (the omron D2F-5 or D2F-5L (Bügel entfernen) ist zu empfehlen), D2F-1 und ähnlich gleich große Mikroschalter funktionieren auch
- 2x M2x10 mm (Linsenkopf Blechschrauben / Selbstschneidend)
- 8-10x 6 mm x 3 mm Magnete 
- 2x M3 x >25mm Innensechskantschrauben Schrauben und Mutter
  
### <u>Sonstiges</u>
- Probe vergleichen https://www.utmel.com/keywords/d2f-5l
- Mikroschalter vonWange https://vonwange.com/product/3x-d2f-5l-mircoswitch/
- Voron Discord (Fleamarket) https://discord.gg/voron

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
  
  

