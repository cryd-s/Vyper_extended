# Basics - Multiklipper
   
### <u>RaspiOS Image runterladen</u>  
- https://www.raspberrypi.com/software/operating-systems/
  
  
### <u>Imager runterladen</u>  
  
- https://www.raspberrypi.org/downloads.../

### Image auf SD Karte spielen
 - Eigenes Image auswählen
 - Passenden SD Karte
 - STRG+Shift+X für erweiterente Einstellungen


### <u>SSH aktivieren</u>  
 - Auf Boot -> "ssh"  
  
### <u>Raspi einrichten</u>  
 - sudo raspi-config  
 - System Options - > Wireless Lan  
 - System Options - > Boot / Autologin -> B2 Console/  Autologin

### <u>Updaten</u>  
  

```
sudo apt get update
``` 
```
sudo apt get upgrade
```  
```
sudo reboot
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
  
### <u>Sonstige Befehle</u>  
  
Serielle Geräte finden:
```
dmesg | grep tty
```

USB Geräte auflisten:
```
lsusb
```

Videogeräte auflisten:
```
v4l2-ctl --list-devices   
```
