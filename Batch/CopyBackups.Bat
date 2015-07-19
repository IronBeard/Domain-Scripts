@Echo Off

REM Author:       Gareth
REM Date:         Friday, 28 August 2009
REM Source:       Zeus (D:\Backups and E:\Virtual Machines\Iris\Iris Backups)
REM Destination:  Hera (D:\Backups and D:\Virtual Machines\Iris\Iris Backups)
REM Description:  This script copies the backups and Iris backups stored on Zeus (D:\Backups and E:\Virtual Machines\Iris\Iris Backups)
REM               to Hera (D:\Backups and D:\Virtual Machines\Iris\Iris Backups) and is run from Hera.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyBackupsLog

CALL %vCopyName% "\\Zeus\Backups" "\\Hera\Backups" %vLogName%
CALL %vCopyName% "\\Zeus\Iris Backups" "\\Hera\Iris Backups" %vLogName%