# How to add this config to OrcaSlicer
First, change the *{printer}*.json file as you please.<br>
Then zip the *{printer}*.json and *{printer}*.info together into a .zip file.<br>
Now you can open OrcaSlicer and Import the .zip file by clicking at the top ☰ menu button.<br> 
*Import*>*Import Configs...*> and select your .zip printer config.


# How to change travel acceleration for your printer?
Right now it is not possible to edit the printer travel acceleration right in the Vyper preset right in OrcaSlicer.<br>
As a workaround, you have to edit the .json.

As an example add the following code snippet to your printer with your wanted acceleration value.<br>
***Do it at your own risk. If set too high you can destroy parts of your printer.***<br> 
***Please know how much your printer may be cable of.***<br>
```json
"machine_max_acceleration_travel": [
        "3200",
        "1000"
    ],
```
If you already imported the preset you can find the imported preset on **Windows** at<br>
C:\Users\\***{YourUserName}***\\AppData\Roaming\OrcaSlicer\user\\***{FolderwithUserID}***.<br>
The changes will only be applied after restarting OrcaSlicer, if you changed the .json file.