# Bed Mesh in Klipper  
  
## <u>Dokumentation</u> 
  
- https://www.klipper3d.org/Bed_Mesh.html  
  
---  
  
  
#############################################################################  
## Abgespeichertes Mesh laden									     
#############################################################################
  
### <u>Im Startcode einpflegen</u>       
  
 `BED_MESH_PROFILE LOAD="Name"`    
  
*Beispiel: BED_MESH_PROFILE LOAD="small" *  
  
---  
#############################################################################  
## Volles Mesh vor dem Druck									     
#############################################################################
  
### <u>Im Startcode einpflegen</u>    
 
 `BED_MESH_CLEAR`
 `BED_MESH_CALIBRATE`  
  
*Beispiel: BED_MESH_PROFILE LOAD="small" *

    
--- 
#############################################################################  
## Bed Mesh im Druckbereich "Area Bed Mesh"									     
############################################################################# 
   
Um ein bedmesh im Druckbereich durchzuführen, muss einmal die "bedmesh_printarea.cfg" erfolgreich eingebunden sein und folgenden Parameter definiert werden:  

- https://github.com/cryd-s/Vyper_extended/blob/main/GCODES/printarea_mesh/bedmesh_printarea.cfg

- in printer.cfg `[include bedmesh_printarea.cfg]`
  
---
  
`variable_parameter_AREA_START_X & Y` = Startparameter X und Y  
`variable_parameter_AREA_END_X & Y` = Endparameter X und Y  
`variable_mesh_min_x & y` = Minimalwert X und Y  
`variable_mesh_max_x & y` = Maximalwert X und Y  
  
```
variable_parameter_AREA_START_X : 0
variable_parameter_AREA_START_Y : 0
variable_parameter_AREA_END_X : 244
variable_parameter_AREA_END_Y : 244
; the "safe" area that the probe can reach, use value in config->[bed_mesh]
variable_mesh_min_x :0
variable_mesh_min_y :0
variable_mesh_max_x :245
variable_mesh_max_y :245
```  
  
---     
**<u>Folgender Startcode ist für den Superslicer zu benutzen:</u>**  
  
`START_PRINT BED={first_layer_bed_temperature} EXTRUDER={first_layer_temperature} AREA_START_X={first_layer_print_min[0]} AREA_START_Y={first_layer_print_min[1]} AREA_END_X={first_layer_print_max[0]} AREA_END_Y={first_layer_print_max[1]}`
   
_Falls Ihr andere Name für die Variablen von Extruder und Bed Temperatur habt, müssen diese natürlich auch angepasst werden_  
  
---
**<u>Folgendes in den StartCode einbauen:</u>**
  
`BED_MESH_PRINT_AREA AREA_START_X={params.AREA_START_X|float} AREA_START_Y={params.AREA_START_Y|float} AREA_END_X={params.AREA_END_X|float} AREA_END_Y={params.AREA_END_Y|float}`  
  
 ---
    
<u>**Wichtiger Hinweis:** </u>  
   
  
Das Script zum PrintArea mesh stammt nicht von uns, sondern wurde von der folgenden Quelle bezogen. Daher bitten wir euch bei Problem, erstmal das Script zu Updaten.
Ebenfalls bedanken wir uns bei dem Ersteller und verweisen hiermit auf Ihn. Das Script wird auf eigene Gefahr benutzt und sollte vor Verwendung geprüft werden.  
  
https://gist.github.com/ChipCE/95fdbd3c2f3a064397f9610f915f7d02
  
---
  
