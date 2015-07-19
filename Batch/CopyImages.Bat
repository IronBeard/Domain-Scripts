@Echo Off

REM Author:       Gareth
REM Date:         Sunday, 6 November 2011
REM Source:       Zeus (D:\Images)
REM Destination:  Hera (D:\Images)
REM Description:  This script copies the Images stored on Zeus (D:\Images) to Hera (D:\Images) and is run from Hera.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyImagesLog

CALL %vCopyName% "\\Zeus\Images" "\\Hera\Images" %vLogName%