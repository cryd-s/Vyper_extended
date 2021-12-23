# Vyper extended
This is a extended Vyper Klipper / Mainsail Config

This Files are only compatible together!

Watch my Youtube Videos to know how it works ;)

Link:


#### Discord: https://discord.gg/xnm6GsynGk


## Timelapse installation:

Connect via Putty to the pi and then do following commands:

>cd ~/

>git clone https://github.com/mainsail-crew/moonraker-timelapse.git

>bash ~/moonraker-timelapse/install.sh


## Input Shaping - uncomment the sections i showed in my video:

https://www.klipper3d.org/Measuring_Resonances.html



### Shortlist Commands:

>~/klippy-env/bin/pip install -v numpy

>sudo apt update
>sudo apt install python-numpy python-matplotlib

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
