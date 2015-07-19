@Echo Off

REM Author:       Gareth
REM Date:         Friday, 28 August 2009
REM Source:       Zeus (F:\Drive Images)
REM Destination:  Hera (D:\Drive Images)
REM Description:  This script copies the drive images stored on Zeus (F:\Drive Images) to Hera (D:\Drive Images) and is run from Hera.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyDriveImagesLog

CALL %vCopyName% "\\Zeus\Drive Images" "\\Hera\Drive Images" %vLogName% /MIR