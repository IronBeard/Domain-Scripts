@Echo Off

REM Author:       Gareth
REM Date:         Sunday, 6 November 2011
REM Source:       Zeus (E:\Users)
REM Destination:  Hera (D:\Users)
REM Description:  This script copies the Users stored on Zeus (E:\Users) to Hera (D:\Users) and is run from Hera.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyUsersLog

CALL %vCopyName% "\\Zeus\Users" "\\Hera\Users" %vLogName%