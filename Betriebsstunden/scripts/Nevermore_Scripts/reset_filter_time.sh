#!/bin/bash

#current date
NOW=$(date +"%Y%m%d")

#Write current date to file, if the file does not exist yet it will be created.
printf $NOW > /home/pi/klipper_config/scripts/Nevermore_Scripts/.ftime.stb

#Checks if the save was successful
if [ $? -eq 0 ]
then
   echo "New date saved successfully ($NOW)"
else
 echo "Error when saving the date"
fi
