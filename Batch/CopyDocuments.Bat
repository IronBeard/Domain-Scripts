@Echo Off

REM Author:       Gareth
REM Date:         Tuesday, 25 January 2011
REM Source:       Zeus (D:\Documents)
REM Destination:  Hera (D:\Documents)
REM Description:  This script copies the documents stored on Zeus (D:\Documents) to Hera (D:\Documents) and is run from Hera.
REM Notes:        
 
SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyDocumentsLog

CALL %vCopyName% "\\Zeus\Documents" "\\Hera\Documents" %vLogName%