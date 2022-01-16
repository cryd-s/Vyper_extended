# Vyper extended
This is a extended Vyper Klipper / Mainsail Config

This Files are only compatible together!

Watch my Youtube Videos to know how it works ;)

### Link: https://www.youtube.com/watch?v=S_K7iB3jYMs&list=PLWqnUinimMN3Upj3a3BzVFsixutHB0ZP5


#### Discord: https://discord.gg/xnm6GsynGk


## Timelapse Installation:

Connect via Putty to the pi and then do following commands:

>cd ~/

>git clone https://github.com/mainsail-crew/moonraker-timelapse.git

>bash ~/moonraker-timelapse/install.sh

## Pressure Advance

https://www.klipper3d.org/Pressure_Advance.html

STL: https://www.klipper3d.org/prints/square_tower.stl

use the PA Profil in Superslicer


## Input Shaping - uncomment the sections i showed in my video:

https://www.klipper3d.org/Measuring_Resonances.html



### Shortlist Commands:

>~/klippy-env/bin/pip install -v numpy

>sudo apt update

>sudo apt install python3-numpy python3-matplotlib

>sudo reboot

>cd ~/klipper/

>sudo cp "./scripts/klipper-mcu-start.sh" /etc/init.d/klipper_mcu

>sudo update-rc.d klipper_mcu defaults

>sudo raspi-config            #enable SPI in interfacing options

>sudo reboot

>cd ~/klipper/

>make menuconfig              #Microcontroller: Linux process

>sudo service klipper stop

>make flash

>sudo service klipper start

>sudo usermod -a -G tty pi

>ACCELEROMETER_QUERY          #Testing the Sensor if there is a Invalid adxl then check the wireing or the offical klipper site

>TEST_RESONANCES AXIS=X

>TEST_RESONANCES AXIS=Y

### To create the graph:

>~/klipper/scripts/calibrate_shaper.py /tmp/resonances_x_*.csv -o /tmp/shaper_calibrate_x.png

>~/klipper/scripts/calibrate_shaper.py /tmp/resonances_y_*.csv -o /tmp/shaper_calibrate_y.png


## Max Accel

https://www.klipper3d.org/Resonance_Compensation.html#tuning

STL: https://www.klipper3d.org/prints/ringing_tower.stl

>TUNING_TOWER COMMAND=SET_VELOCITY_LIMIT PARAMETER=ACCEL START=1250 FACTOR=100 BAND=5

