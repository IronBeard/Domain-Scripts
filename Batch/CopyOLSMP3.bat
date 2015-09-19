@Echo Off

REM Author:       Gareth
REM Date:         Saturday, 5 September 2015
REM Source:       Zeus (D:\MP3)
REM Destination:  Hephaestus (E:\Dropbox\MP3)
REM Description:  This script copies the MP3's stored on Zeus (D:\MP3) to Hephaestus (E:\Dropbox\MP3) and is run from Hephaestus.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyOLSMP3Log

CALL %vCopyName% "W:" "E:\Dropbox\MP3" %vLogName% /XO /MIR