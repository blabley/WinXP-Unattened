CLS
@echo off
TITLE Unattended Windows Install: Creating Image
ECHO.
ECHO This step removes any attributes from directory
attrib -R -H F:\PC\XP-InternetKiosk /S /D
ECHO. 
ECHO Now creating ISO image...
CDIMAGE.EXE -lWindows -t12/31/2002,12:00:00 -h -j1 -m -bxpbootpro.img F:\PC\XP-InternetKiosk F:\PC\XP-InternetKiosk.ISO
EXIT