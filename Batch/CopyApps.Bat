@Echo Off

REM Author:       Gareth
REM Date:         Saturday, 5 November 2011
REM Source:       Zeus (D:\Apps)
REM Destination:  Hera (D:\Apps)
REM Description:  This script copies the Portable Apps stored on Zeus (D:\Apps) to Hera (D:\Apps) and is run from Hera.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyAppsLog

CALL %vCopyName% "\\Zeus\Apps" "\\Hera\Apps" %vLogName%