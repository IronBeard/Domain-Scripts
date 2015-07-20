@Echo Off

REM Author:       Gareth
REM Date:         Monday, 7 March 2011
REM Source:       HEPHAESTUS (C:\Users\Gareth\Documents\)
REM Destination:  ZEUS       (D:\Backups\Programming\Current)
REM Description:  This script copies the Visual Studio Projects stored on Hephaestus (C:\Users\Gareth.OLYMPUS\Documents\) to 
REM               Zeus (D:\Backups\Programming\Current) and is run from Hephaestus.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyProjectsLog

CALL %vCopyName% "C:\Users\Gareth.OLYMPUS\Documents\Android" "Y:\Programming\Current\Android" %vLogName%
CALL %vCopyName% "C:\Users\Gareth.OLYMPUS\Documents\Arduino" "Y:\Programming\Current\Arduino" %vLogName%
CALL %vCopyName% "C:\Users\Gareth.OLYMPUS\Documents\Raspberry Pi" "Y:\Programming\Current\Raspberry Pi" %vLogName%
CALL %vCopyName% "C:\Users\Gareth.OLYMPUS\Documents\Domain-Scripts" "Y:\Programming\Current\Domain-Scripts" %vLogName%
CALL %vCopyName% "C:\Users\Gareth.OLYMPUS\Documents\Visual Studio 2005\Projects" "Y:\Programming\Current\Visual Studio 2005\Projects" %vLogName%
CALL %vCopyName% "C:\Users\Gareth.OLYMPUS\Documents\Visual Studio 2008\Projects" "Y:\Programming\Current\Visual Studio 2008\Projects" %vLogName%
CALL %vCopyName% "C:\Users\Gareth.OLYMPUS\Documents\Visual Studio 2013\Projects" "Y:\Programming\Current\Visual Studio 2008\Projects" %vLogName%