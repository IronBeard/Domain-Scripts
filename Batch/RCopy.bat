@Echo Off

REM Copies the specified source directory to the specified destination directory
REM logging the results to the specified log file.
REM %4 and %5 is used to pass through extra optional parameters, if any more parameters
REM are added this will need to be incremented.

REM error checks
IF (%1)==() GOTO ERROR_source_dir_not_found
IF (%2)==() GOTO ERROR_destination_dir_not_found
IF (%3)==() GOTO ERROR_log_filename_not_specified

REM Set Variable with today's date
FOR /F "tokens=2-4 delims=/- " %%A IN ('date/T') DO SET vDate=%%C%%B%%A

SET vLogLoc=\\Zeus\Backups\Logs\
SET sLogName=%vLogLoc%%3-%vDate%.txt
SET vLogOpts=/LOG+:"%sLogName%"
SET vOptions=*.* /E /R:3 /W:10 /NP /ZB %4 %5

title Copying %1 To %2 (Logged as: %vLogOpts%)

Robocopy %1 %2 %vOptions% %vLogOpts%
IF ERRORLEVEL 16 ECHO ***FATAL ERROR*** & goto ERROR_Report_Fatal
IF ERRORLEVEL 15 ECHO OKCOPY + FAIL + MISMATCHES + XTRA & goto ERROR_Report_Copy_Failures
IF ERRORLEVEL 14 ECHO FAIL + MISMATCHES + XTRA & goto ERROR_Report_Copy_Failures
IF ERRORLEVEL 13 ECHO OKCOPY + FAIL + MISMATCHES & goto ERROR_Report_Copy_Failures
IF ERRORLEVEL 12 ECHO FAIL + MISMATCHES& goto ERROR_Report_Copy_Failures
IF ERRORLEVEL 11 ECHO OKCOPY + FAIL + XTRA & goto ERROR_Report_Copy_Failures
IF ERRORLEVEL 10 ECHO FAIL + XTRA & goto ERROR_Report_Copy_Failures
IF ERRORLEVEL 9 ECHO OKCOPY + FAIL & goto ERROR_Report_Copy_Failures
IF ERRORLEVEL 8 ECHO FAIL & goto ERROR_Report_Copy_Failures
IF ERRORLEVEL 7 ECHO OKCOPY + MISMATCHES + XTRA & goto EOF
IF ERRORLEVEL 6 ECHO MISMATCHES + XTRA & goto EOF
IF ERRORLEVEL 5 ECHO OKCOPY + MISMATCHES & goto EOF
IF ERRORLEVEL 4 ECHO MISMATCHES & goto EOF
IF ERRORLEVEL 3 ECHO OKCOPY + XTRA & goto EOF
IF ERRORLEVEL 2 ECHO XTRA & goto EOF
IF ERRORLEVEL 1 ECHO OKCOPY & goto EOF
IF ERRORLEVEL 0 ECHO No Change & goto EOF

:ERROR_Report_Fatal
set to=-to GarethPhilpott@Hotmail.com
set f=-f CopyError@slingshot.co.nz
set subject=-s "\"Domain Backup - ***FATAL ERROR***\""
set body=-body "\"There was a fatal error during the copy process from %1 To %2. Please check the %sLogName% logs for details\""
set server=-server mail.orcon.net.nz
:: Note, I named the vars the same as Blat's paramaters.
\\Zeus\Apps\Blat\full\Blat.exe %to% %f% %subject% %server% %body%
GOTO :EOF

:ERROR_Report_Copy_Failures
set to=-to GarethPhilpott@Hotmail.com
set f=-f CopyError@slingshot.co.nz
set subject=-s "\"Domain Backup - Copy Failures\""
set body=-body "\"There were errors encountered during the copy process from %1 To %2. Please check the %sLogName% logs for details\""
set server=-server mail.orcon.net.nz
:: Note, I named the vars the same as Blat's paramaters.
\\Zeus\Apps\Blat\full\Blat.exe %to% %f% %subject% %server% %body%
GOTO :EOF

:ERROR_source_dir_not_found
ECHO source :: Source Directory (drive:\path or \\server\share\path).
ECHO i.e. %0 drive:\path [Destination] [Log File]
ECHO Or   %0 \\server\share\path [Destination] [Log File]
GOTO :EOF

:ERROR_destination_dir_not_found
ECHO destination :: Destination Dir  (drive:\path or \\server\share\path).
ECHO i.e. %0 [Source] drive:\path [Log File]
ECHO Or   %0 [Source] \\server\share\path [Log File]
GOTO :EOF

:ERROR_log_filename_not_specified
ECHO The drive letter of the directory to backup needs to be added
ECHO i.e. %0 [Source] [Destination] CopyFilesLog
GOTO :EOF

:EOF