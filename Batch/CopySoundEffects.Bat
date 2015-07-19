@Echo Off

REM Author:       Gareth
REM Date:         Sunday, 6 November 2011
REM Source:       Zeus (D:\Sound Effects)
REM Destination:  Hera (D:\Sound Effects)
REM Description:  This script copies the Sound Effects stored on Zeus (D:\Sound Effects) to Hera (D:\Sound Effects) and is run from Hera.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopySoundEffectsLog

CALL %vCopyName% "\\Zeus\Sound Effects" "\\Hera\Sound Effects" %vLogName%