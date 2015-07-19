@Echo Off

REM Author:       Gareth
REM Date:         Friday, 28 August 2009
REM Source:       Zeus (D:\Programs)
REM Destination:  Hera (D:\Programs)
REM Description:  This script copies the Programs stored on Zeus (D:\Programs) to Hera (D:\Programs) and is run from Hera.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyProgramsLog

CALL %vCopyName% "\\Zeus\Programs" "\\Hera\Programs" %vLogName%