@Echo Off

REM This script copies the D:\Photos directory across to Poseidon.

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyOLSFileListsLog

CALL %vCopyName% "\\Zeus\Backups\File Lists" "D:\Dropbox\Backups\File Lists" %vLogName% /XO
REM Robocopy "\\Zeus\Backups\File Lists" "Z:\Gareths SkyDrive\Backups\File Lists" *.* /E /R:3 /W:10 /NP /Z /XO /XN /LOG+:"CopyFileLists - %vDate%.txt"