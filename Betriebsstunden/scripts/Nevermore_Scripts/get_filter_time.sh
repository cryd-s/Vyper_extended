#!/bin/bash

#$1 is the number of days to swap
#current date
NOW=$(date +"%Y%m%d")

# Loading the date of the last reset
ResetTime=$(head -1 /home/pi/klipper_config/scripts/Nevermore_Scripts/.ftime.stb) 

# Determine daily difference
let DIFF=($(date +%s -d $NOW)-$(date +%s -d $ResetTime))/86400

#Determine remaining days
let vtausch=$(expr $1 - $DIFF)

#Output of the values in Klipper
printf "%s Limit value in days: $1
        Current Date: $NOW
        Last reset: $ResetTime
        Difference: $DIFF days
        Remaining: $vtausch days"

# Check whether the activated carbon must be replaced after the expiry of the days
if (( $DIFF >= $1 ))
then
  printf "%s\n Activated carbon must be replaced!"
else
 printf "%s\n Activated carbon still I.O"
fi

