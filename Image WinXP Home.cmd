CLS
@echo off
TITLE Unattended Windows Install: Creating Image
ECHO.
ECHO This step removes any attributes from the c:\xpcd directory
attrib -R -H E:\PC\XP_UA+VMware /S /D
ECHO. 
CDIMAGE.EXE -lXP_UA+VM -t12/31/2002,12:00:00 -h -j1 -m -bxpboothome.img E:\PC\XP_UA+VMware "%USERPROFILE%\Desktop\XP_UA+VMware.iso"
ECHO.
PAUSE
EXIT