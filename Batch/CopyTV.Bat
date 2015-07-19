@Echo Off

REM Author:       Gareth
REM Date:         Wednesday, 29 July 2009
REM Source:       Dionysus/PIAP
REM Destination:  Hera (D:\TV)
REM Description:  This script copies the TV stored on Dionysus and PIAP to Hera (D:\TV) and is run from Hera.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyTVLog

CALL %vCopyName% "\\Dionysus\video\TV" "\\Hera\TV" %vLogName%
REM CALL %vCopyName% "\\Zeus\D$\TV" "\\Hera\D$\TV" %vLogName%
REM CALL %vCopyName% "\\PIAP\media\TV\- To Watch -" "\\Hera\TV\- To Watch -" %vLogName%