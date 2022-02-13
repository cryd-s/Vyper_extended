# Basics - Multiklipper -Timelapse
  
### <u>Ordner anlegen:</u>  
  
1. Drucker Timelapse Foto Zwischenspeicher anlegen
```
mkdir -p /tmp/timelapse
``` 
2. Drucker Timelapse Foto Zwischenspeicher anlegen
```
mkdir -p /tmp/timelapse2
```
Timelapse Video Verzeichnigs anlegen  
```  
/home/pi/gcode_files/Timelapse/
```  

### <u>Install.sh implementieren:</u> 
- Hochladen von "printer_1_install.sh" & "printer_2_install.sh" via FTP in "/home/pi/moonraker-timelapse"
- Alte install.sh umnennen in install.sh.backup
- Install für printer 1 installieren:
```  
mv /home/pi/moonraker-timelapse/printer_1_install.sh /home/pi/moonraker-timelapse/install.sh
``` 
```  
chmod +x /home/pi/moonraker-timelapse/install.sh
```
- - Install für printer 2 installieren:
```  
mv /home/pi/moonraker-timelapse/printer_2_install.sh /home/pi/moonraker-timelapse/install.sh
``` 
```  
chmod +x /home/pi/moonraker-timelapse/install.sh
```