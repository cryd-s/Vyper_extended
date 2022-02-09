##!/bin/bash
# Version 4
# Set variables your Variables

show_coords=false # true = enabled / false = diabled
limitx=220    #set the limit of X axis
limity=220    #set the limit of y axis
port=7125     #set your printers moonraker port 7125 is standard
IP=192.168.1.65
config_loc=$HOME/klipper_config/

# please check user permissions for execution
# if needed do "sudo chown gcode_analyzer_2.0.sh" on this file

#############################
# Dont touch the area below #


# set variables
safey=Y$limity #rename limit
safex=Y$limitx #rename limit

y_conflict=/tmp/yconflict.txt
x_conflict=/tmp/xconflict.txt
count=/tmp/count.txt
gcode=$config_loc/scripts/output/gcode_check.cfg
cat $gcode

# get filenames
filename=`curl -s http://$IP:$port/printer/objects/query?print_stats | awk '{print $11}' | sed 's/"//g' | sed 's/,//g'`
file=$(ls -tr ${HOME}/gcode_files/|tail -1) #newest filename by date
filepath=${HOME}/gcode_files/$filename



# create need files
touch $x_conflict
touch $y_conflict
touch $count
touch $gcode
mkdir -p $config_loc/scripts/
mkdir -p $config_loc/scripts/output/
# command section

echo -e "###################"
echo -e "#Gcode Analyzer v1#"
echo -e "###################"


echo -e ""
echo -e "------OPTIONS_AND_CHECKS------"
# show selected printer
echo -e "Your selected printer "$(hostname -I)"on port "$port"" 

# Filecheck
if [ $filename ];then
echo -e "Filename accepted"
start=1
else
echo "No active File / Printjob  "
start=0
fi

if [ $start = "1" ];then

# show selected file
echo -e ""
echo -e "----------------------------------------------"
echo -e "You select File names "$filename" for Movement-Check"
echo -e "----------------------------------------------"
echo -e ""

# show conflicts on y
grep "Y[2][2-9]" $filepath > $y_conflict
echo -e "Possible conflicts on Y in dangerzone: $(grep -c "Y" $y_conflict)"
if [ $show_coords == "true" ];then
echo -e "--------------------------------"
echo -e "Coordinates:"
cat $y_conflict
fi
# show conflicts on x
echo -e "--------------------------------"
grep -e "X[2][2-9]" $y_conflict > $x_conflict
echo -e "Conflicts on X in dangerzone: $(grep -c "X" $x_conflict)"
if [ $show_coords == "true" ];then
echo -e "--------------------------------"
echo -e "Coordinates"
cat $x_conflict
fi
echo -e ""
echo -e "--------------------------------"
# Processing conflicts
grep -c "X" $x_conflict > $count
count2=`cat $count`
if [ $count2 -ge 1 ];then
   echo -e
   echo -e "#########################"
   echo -e "#Object in Dangerzone!!!#"
   echo -e "#-----Print Cancled-----#"
   echo -e "#########################"
   echo "# Automatic generated
[gcode_macro _gcode_check]
variable_gcode_check: False
gcode:" > $gcode

else
   echo "# Automatic generated
[gcode_macro _gcode_check]
variable_gcode_check: True
gcode:" > $gcode
   echo -e
   echo -e "#########################"
   echo -e "#----Object accepted----#"
   echo -e "#########################"

fi

else
  echo -e ""
  echo -e "########################"
  echo -e "#!!!!Script cancled!!!!#"
  echo -e "#!No filename detected #"
  echo -e "########################"
  echo "# Automatic generated
[gcode_macro _gcode_check]
variable_gcode_check: False
gcode:" > $gcode
fi

#### End
# Created by CrydTV - Community - Robin




