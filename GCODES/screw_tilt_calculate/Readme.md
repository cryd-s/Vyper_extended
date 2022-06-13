Screw Tilt Calculate
====================

Hallo,
hier findet ihr die Infos zum `SCREWS_TILT_CALCULATE` Befehl.
  
Diese dienen lediglich als Orientierung und die Benutztung 
geht auf <u>**eigene Gefahr**</u>.
  
Daher prüft bitte, ob diese für euren Drucker passen und euch logisch erscheinen.
  
---
  
Befehle:
------

`SCREWS_TILT_CALCULATE` = Führt das Skript aus
`SCHRAUBEN` = Fährt den Kopf weg, sodass man die Schrauben gut erreicht  

------  
  
Auswertung
-----------------

```
hinten_rechts_aussen : x=210.0, y=203.0, z=2.10030 : adjust CW 00:01
hinten_links_aussen : x=30.0, y=203.0, z=2.12280 : adjust CW 00:03
vorne_rechts_aussen : x=210.0, y=42.0, z=2.08530 : adjust CCW 00:00
vorne_links_aussen (base) : x=30.0, y=42.0, z=2.08780
```

>vorne_links_aussen (base) = Bezugspunkt 
   
>hinten_rechts_aussen : z=2.10030 : adjust CW 
00:01  -> CW im Uhrzeigersinn nachjustieren  

>hinten_links_aussen  : z=2.12280 : adjust CCW 
00:03  -> CCW im Gegen-Uhrzeigersinn nachjustieren  

>vorne_rechts_aussen  : z=2.08530 : adjust CCW 00:00 -> passt   


<p align="left">
  <img src="./images/schraubenpositionen.jpg" width="500" title="Schraubenpositionen">
</p>


--- 
Dokumentation
---

Dokumentationen zu Gcodes oder Klipper findet ihr hier:
  

https://www.klipper3d.org/G-Codes.html?h=scre#screws_tilt_calculate
https://www.klipper3d.org/Config_Reference.html?h=scre#screws_tilt_adjust
  
  
-------------------------------
CrydTeam
  
