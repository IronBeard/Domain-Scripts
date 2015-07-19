@ECHO OFF

REM Creates an image of the specified drive using DriveImage XML and stores it
REM on Zeus. It deletes all images older than 30 days, which at 1 image a week
REM should leave 3 or 4 images plus the initial image taken after DriveImage XML
REM was installed.

REM error checks
IF (%1)==() GOTO ERROR_dir_not_found

title Creating Drive Image of %COMPUTERNAME%

REM Set the backup location
SET vBackupLocation=\\Zeus\Drive Images\Drive Images\%COMPUTERNAME%\

REM Set DriveImage XML directory
REM SET vdixml="C:\Program Files\Runtime Software\DriveImage XML\dixml.exe"
SET vdixml="%ProgramFiles%\Runtime Software\DriveImage XML\dixml.exe"

REM Set Variable with today's date
FOR /F "tokens=2-4 delims=/- " %%A IN ('date/T') DO SET vDate=%%C%%B%%A

REM Execute DriveImage XML - Options found at: http://www.runtime.org/driveimage_faq.htm
%vdixml% /b%1 /t"%vBackupLocation%Drive %1 - %vDate%" /r- /s- /c2 /v

REM Delete all images older than 30 days (At 1 a week it should leave 3 or 4 images)
PushD "%vBackupLocation%" &&("forfiles.exe" /m "*.*" /d -30 /c "cmd /c del @file") & PopD
GOTO :EOF

:ERROR_dir_not_found
ECHO The drive letter of the directory to backup needs to be added
ECHO i.e. %0 C
GOTO :EOF