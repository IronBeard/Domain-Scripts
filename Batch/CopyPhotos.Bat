@Echo Off

REM Author:       Gareth
REM Date:         Saturday, 29 August 2009
REM Source:       Zeus (D:\Photos)
REM Destination:  Hera (D:\Photos)
REM Description:  This script copies the Photos stored on Zeus (D:\Photos) to Hera (D:\Photos) and is run from Hera.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyPhotosLog

CALL %vCopyName% "\\Zeus\Photos" "\\Hera\Photos" %vLogName%