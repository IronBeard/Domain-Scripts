@Echo Off

REM This script copies the D:\Photos directory across to Poseidon.

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyOLSPhotosLog

CALL %vCopyName% "\\Zeus\Photos" "D:\Dropbox\Photos" %vLogName% /XO
REM Robocopy "\\Zeus\Photos" "Z:\Gareths SkyDrive\Backups\Photos" *.* /E /R:3 /W:10 /NP /Z /XO /XN /LOG+:"CopyPhotos - %vDate%.txt"