@Echo Off

REM Author:       Gareth
REM Date:         Wednesday, 29 July 2009
REM Source:       Dionysus
REM Destination:  Hera (D:\Movies)
REM Description:  This script copies the Movies stored on Dionysus to Hera (D:\Movies) and is run from Hera.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyMoviesLog

CALL %vCopyName% "\\Dionysus\video\Movies" "\\Hera\Movies" %vLogName%