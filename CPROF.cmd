CLS
@echo off
TITLE Unattended Windows Install: Creating Image
ECHO.
ECHO This step removes any attributes from the c:\xpcd directory
attrib -R -H Y:\5IN1_XP\ROOT\CPROF /S /D
ECHO. 
CDIMAGE.EXE -lWXPUNA_EN -t12/31/2002,12:00:00 -h -j1 -m -bxpbootpro.img Y:\5IN1_XP\ROOT\CPROF "Y:\ISOs\OS CDs\XP_Corp_SP2.ISO"
ECHO.
PAUSE
EXIT