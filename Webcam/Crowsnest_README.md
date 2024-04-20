# Basics - Crowsnest - Mehr Webcam FPS  
  
*Link zum Crowsnets Github:*

https://github.com/mainsail-crew/crowsnest  
  

### <u>**Crownest installieren**</u>

```
cd ~
```
```
git clone https://github.com/mainsail-crew/crowsnest.git
```
```
cd crowsnest
```
```
make install
```

### <u>**Crownest deinstallieren**</u>
```
cd ~/crowsnest
```
```
make uninstall
```

### <u>**Moonraker.conf anpassen**</u>
- Moonraker.conf in Mainsail öffnen
- Eintrag einfügen
```
[update_manager webcamd]
type: git_repo
path: ~/crowsnest
origin: https://github.com/mainsail-crew/crowsnest.git
```

### <u>**Camera konfigureren**</u>
- Die Konfig Datei ist folgende ~/klipper_config/webcam.conf
```

#### crowsnest.conf
#### This is a typical default config.
#### Also used as default in mainsail / MainsailOS
#### See:
#### https://github.com/mainsail-crew/crowsnest/blob/master/README.md
#### for details to configure to your needs.


#####################################################################
####                                                            #####
####      Information about ports and according URL's           #####
####                                                            #####
#####################################################################
####                                                            #####
####    Port 8080 equals /webcam/?action=[stream/snapshot]      #####
####    Port 8081 equals /webcam2/?action=[stream/snapshot]     #####
####    Port 8082 equals /webcam3/?action=[stream/snapshot]     #####
####    Port 8083 equals /webcam4/?action=[stream/snapshot]     #####
####                                                            #####
####    Note: These ports are default for most Mainsail         #####
####    installations. To use any other port would involve      #####
####    changing the proxy configuration or using directly      #####
####    http://<ip>:<port>/?action=[stream/snapshot]            #####
####                                                            #####
#####################################################################
####    RTSP Stream URL: ( if enabled and supported )           #####
####    rtsp://<ip>:<rtsp_port>/stream.h264                     #####
#####################################################################


[crowsnest]
log_path: %LOGPATH%
log_level: verbose                      # Valid Options are quiet/verbose/debug
delete_log: false                       # Deletes log on every restart, if set to true
no_proxy: false

[cam 1]
mode: ustreamer                         # ustreamer - Provides mjpg and snapshots. (All devices)
                                        # camera-streamer - Provides webrtc, mjpg and snapshots. (rpi + Raspi OS based only)
enable_rtsp: false                      # If camera-streamer is used, this enables also usage of an rtsp server
rtsp_port: 8554                         # Set different ports for each device!
port: 8080                              # HTTP/MJPG Stream/Snapshot Port
device: /dev/video0                     # See Log for available ...
resolution: 640x480                     # widthxheight format
max_fps: 15                             # If Hardware Supports this it will be forced, otherwise ignored/coerced.
#custom_flags:                          # You can run the Stream Services with custom flags.
#v4l2ctl:                               # Add v4l2-ctl parameters to setup your camera, see Log what your cam is capable of.

```

*[cam 1] = Kamera zuordnung (Bitte immer nur die Zahl aufsteigend ändern)  
stream = Streamer service; ustreamer oder rtsp kann ausgewählt werden  
port = Port (Sollte sich von den anderen Webcams unterscheiden; keine Doppelbelegung)  
device = Kamera "Port" (über "v4l2-ctl --list-devices" rausfinden )  
resolution = Auflösung (1920x1080; 1280x720)  
max_fps= maximale FPS*

### <u>**Befehle**</u>

```
v4l2-ctl --list-devices   
```
```
v4l2-ctl --list-ctrls   
```
```
v4l2-ctl --set-ctrl=focus_auto=0 
```
### <u>**Beispiel**</u>
```
[cam 1]
mode: ustreamer                         # ustreamer - Provides mjpg and snapshots. (All devices)
                                        # camera-streamer - Provides webrtc, mjpg and snapshots. (rpi + Raspi OS based only)
enable_rtsp: false                      # If camera-streamer is used, this enables also usage of an rtsp server
rtsp_port: 8554                         # Set different ports for each device!
port: 8080                              # HTTP/MJPG Stream/Snapshot Port
device: /dev/video0                     # See Log for available ...
resolution: 640x480                     # widthxheight format
max_fps: 30                             # If Hardware Supports this it will be forced, otherwise ignored/coerced.
v4l2ctl: focus_auto=0,focus_absolute=30
```
