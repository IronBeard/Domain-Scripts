@Echo Off

REM This script copies the D:\Photos directory across to Poseidon.

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyOLSDocumentsLog

CALL %vCopyName% "\\Zeus\Documents" "D:\Dropbox\Backups\Documents" %vLogName% /XO
REM Robocopy "\\Zeus\Documents" "Z:\Gareths SkyDrive\Backups\Documents" *.* /E /R:3 /W:10 /NP /Z /XO /XN /LOG+:"CopyDocuments - %vDate%.txt"