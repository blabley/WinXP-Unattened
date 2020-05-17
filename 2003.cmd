CLS
@echo off
TITLE Unattended Windows Install: Creating Image
ECHO.
ECHO This step removes any attributes from directory
attrib -R -H Y:\W2k3 /S /D
ECHO. 
ECHO Now creating ISO image...
CDIMAGE.EXE -l2003_UA -t12/31/2002,12:00:00 -h -j1 -m -b2k3BootImage.img Y:\W2k3 Y:\2003_UA.ISO
EXIT