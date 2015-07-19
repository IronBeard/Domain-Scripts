@Echo Off

REM This script generates a list of all the files on the server by drive and places 
REM them in a txt file named after the drive.

REM NOTE: The /A-D stops the directories from appearing at the beginning of the file.
REM NOTE: The |find /v /i "\{Directory}\" excludes that directory from the output.
REM i.e - dir "D:\" /A-D /S /B |find /v /i "\Images\" > "D:\Backups\File Lists\D.txt"

title Generating File Lists

dir "D:\" /A-D /S /B > "D:\Backups\File Lists\D.txt"
dir "E:\" /A-D /S /B > "D:\Backups\File Lists\E.txt"
dir "F:\" /A-D /S /B > "D:\Backups\File Lists\F.txt"

dir "D:\MP3"                  /A-D /S /B > "D:\Backups\File Lists\MP3.txt"
dir "\\Dionysus\video\Movies" /A-D /S /B > "D:\Backups\File Lists\Movies.txt"
dir "\\Dionysus\video\TV"     /A-D /S /B > "D:\Backups\File Lists\TV.txt"