@Echo Off

REM Author:       Gareth
REM Date:         Wednesday, 29 July 2009
REM Source:       Zeus (D:\Music Videos)
REM Destination:  Hera (D:\Music Videos)
REM Description:  This script copies the Images stored on Zeus (D:\Music Videos) to Hera (D:\Music Videos) and is run from Hera.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyMusicVideosLog

CALL %vCopyName% "\\Zeus\Music Videos" "\\Hera\Music Videos" %vLogName%