ADD this to your PRINTER.CFG:

[exclude_object]

add https://github.com/kageurufu/cancelobject-preprocessor/releases to your superslicer directory

Add this to your Superslicer PRINT SETTINGS (tab) - Post Processing scripts:
preprocess_cancellation.exe;

Now, after slicing, a extra proces runs and enables the exclusion per object in Mainsail (probably also fluid).

It only becomes visable when a print started in your PAUSE/CANCEL tab.


https://share.g-portal.com/v1y1ws.png
![Alt text](images/cancle_onjects_example.jpg?raw=true "Title")