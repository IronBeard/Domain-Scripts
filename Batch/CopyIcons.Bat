@Echo Off

REM Author:       Gareth
REM Date:         Sunday, 6 November 2011
REM Source:       Zeus (D:\Icons)
REM Destination:  Hera (D:\Icons)
REM Description:  This script copies the Icons stored on Zeus (D:\Icons) to Hera (D:\Icons) and is run from Hera.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyIconsLog

CALL %vCopyName% "\\Zeus\Icons" "\\Hera\Icons" %vLogName%