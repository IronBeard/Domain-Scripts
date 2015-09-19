@Echo Off

REM Author:       Gareth
REM Date:         Saturday, 5 September 2015
REM Source:       Hephaestus (E:\Dropbox\Projects)
REM Destination:  Hephaestus (C:\Users\Gareth.OLYMPUS\OneDrive\Projects)
REM Description:  This script copies the Projects from DropBox stored on Hephaestus (E:\Dropbox\Projects) to OneDrive stored on Hephaestus (C:\Users\Gareth.OLYMPUS\OneDrive\Projects) and is run from Hephaestus.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyOLSProjectsLog

CALL %vCopyName% "E:\Dropbox\Projects" "C:\Users\Gareth.OLYMPUS\OneDrive\Projects" %vLogName% /XO /MIR