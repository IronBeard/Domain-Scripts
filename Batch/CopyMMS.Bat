@Echo Off

REM Author:       Gareth
REM Date:         Wednesday, 29 July 2009
REM Source:       Zeus (D:\MMS)
REM Destination:  Hera (D:\MMS)
REM Description:  This script copies the MMS data stored on Zeus (D:\MMS) to Hera (D:\MMS) and is run from Hera.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyMMSLog

CALL %vCopyName% "\\Zeus\MMS" "\\Hera\MMS" %vLogName%