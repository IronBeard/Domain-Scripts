@Echo Off

REM Author:       Gareth
REM Date:         Wednesday, 29 July 2009
REM Source:       Zeus (D:\MP3)
REM Destination:  Hera (D:\MP3)
REM Description:  This script copies the MP3's stored on Zeus (D:\MP3) to Hera (D:\MP3) and is run from Hera.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyMP3Log

CALL %vCopyName% "\\Zeus\MP3" "\\Hera\MP3" %vLogName%