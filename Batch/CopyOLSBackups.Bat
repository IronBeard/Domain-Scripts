@Echo Off

REM This script copies the D:\Photos directory across to Poseidon.

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyOLSBackupsLog

CALL %vCopyName% "\\Zeus\Iris Backups\DataBase" "D:\Dropbox\Backups\Database" %vLogName% /XO /XN
REM Robocopy "\\Zeus\Iris Backups\DataBase" "Z:\Gareths SkyDrive\Backups\Database" *.* /E /R:3 /W:10 /NP /Z /XO /XN /LOG+:"CopyIrisBackups - %vDate%.txt"