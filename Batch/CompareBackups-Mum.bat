@Echo Off

REM Author:       Gareth
REM Date:         Tuesday, 03 September 2013
REM Source:       Dionysus
REM Destination:  BigL
REM Description:  This script compares the backups from Mum and Dads house against Dionysus, reporting all extra files
REM               that are not on the media share. This is run from BigL (Mums Machine).
REM Notes:        

SET vLogLoc=\\Zeus\Backups\Logs\
SET vOptions=*.* /E /R:3 /W:10 /XN /NP /Z /NOCOPY /NDL

title Comparing Movies and TV

rasdial "Gareth" "Allison" luke05

robocopy "\\RAYAL\media\Movies" "\\Dionysus\video\Movies" %vOptions% /LOG:"%vLogLoc%CompareMovies-Mum.txt"

robocopy "\\RAYAL\media\TV" "\\Dionysus\video\TV" %vOptions% /LOG:"%vLogLoc%CompareTV-Mum.txt"

GOTO :EOF