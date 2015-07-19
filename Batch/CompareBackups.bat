@Echo Off

REM Author:       Gareth
REM Date:         Wednesday, 20 July 2011
REM Source:       Zeus/Dionysus/PIAP
REM Destination:  Hera
REM Description:  This script compares the backups from Zeus, Dionysus and PIAP against Hera, reporting all extra files
REM               that are no longer on Zeus or Dionysus. This is run from Hera.
REM Notes:        

SET vLogLoc=\\Zeus\Backups\Logs\
SET vOptions=*.* /E /R:3 /W:10 /NP /ZB /NOCOPY /NDL

title 01 of 16 - Comparing Apps
robocopy "\\Zeus\Apps" "\\Hera\Apps" %vOptions% /LOG:"%vLogLoc%CompareApps.txt"
title 02 of 16 - Comparing Backups
robocopy "\\Zeus\Backups" "\\Hera\Backups" %vOptions% /LOG:"%vLogLoc%CompareBackups.txt"
title 03 of 16 - Comparing Documents
robocopy "\\Zeus\Documents" "\\Hera\Documents" %vOptions% /LOG:"%vLogLoc%CompareDocuments.txt"
title 04 of 16 - Comparing Ebook
robocopy "\\Zeus\Ebook" "\\Hera\Ebook" %vOptions% /LOG:"%vLogLoc%CompareEbook.txt"
title 05 of 16 - Comparing Icons
robocopy "\\Zeus\Icons" "\\Hera\Icons" %vOptions% /LOG:"%vLogLoc%CompareIcons.txt"
title 06 of 16 - Comparing Images
robocopy "\\Zeus\Images" "\\Hera\Images" %vOptions% /LOG:"%vLogLoc%CompareImages.txt"
title 07 of 16 - Comparing MMS
robocopy "\\Zeus\MMS" "\\Hera\MMS" %vOptions% /LOG:"%vLogLoc%CompareMMS.txt"
title 08 of 16 - Comparing Movies
robocopy "\\Dionysus\video\Movies" "\\Hera\Movies" %vOptions% /LOG:"%vLogLoc%CompareMovies.txt"
title 09 of 16 - Comparing MP3
robocopy "\\Zeus\MP3" "\\Hera\MP3" %vOptions% /LOG:"%vLogLoc%CompareMP3.txt"
title 10 of 16 - Comparing Music Videos
robocopy "\\Zeus\Music Videos" "\\Hera\Music Videos" %vOptions% /LOG:"%vLogLoc%CompareMusicVideos.txt"
title 11 of 16 - Comparing Photos
robocopy "\\Zeus\Photos" "\\Hera\Photos" %vOptions% /LOG:"%vLogLoc%ComparePhotos.txt"
title 12 of 16 - Comparing Programs
robocopy "\\Zeus\Programs" "\\Hera\Programs" %vOptions% /LOG:"%vLogLoc%ComparePrograms.txt"
title 13 of 16 - Comparing Sound Effects
robocopy "\\Zeus\Sound Effects" "\\Hera\Sound Effects" %vOptions% /LOG:"%vLogLoc%CompareSoundEffects.txt"
title 14 of 16 - Comparing TV
robocopy "\\Dionysus\video\TV" "\\Hera\TV" %vOptions% /LOG:"%vLogLoc%CompareTV.txt"
title 15 of 16 - Comparing TV
REM robocopy "\\PIAP\media\TV\- To Watch -" "\\Hera\TV\- To Watch -" %vOptions% /LOG:"%vLogLoc%CompareTV.txt"
title 16 of 16 - Comparing Users
robocopy "\\Zeus\Users" "\\Hera\Users" %vOptions% /LOG:"%vLogLoc%CompareUsers.txt"
GOTO :EOF