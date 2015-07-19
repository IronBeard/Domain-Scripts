@Echo Off

REM Author:       Gareth
REM Date:         Monday, 16 September 2013
REM Description:  Deletes all of those pesky Thumbs.db files
REM Notes:        IF "%DRIVE:~-1%"==":" SET DRIVE=%DRIVE:~0,-1% checks the input
REM               parameter to see if it is a : and if so removes it.

REM error checks
IF (%1)==() GOTO ERROR_source_dir_not_found

SET DRIVE=%1

title Removing Thumbs.db Files From %1

REM Removes the trailing character, in this case a \
IF "%DRIVE:~-1%"=="\" SET DRIVE=%DRIVE:~0,-1%

del /s /q /f /a:h "%DRIVE%\Thumbs.db"
GOTO :EOF

:ERROR_source_dir_not_found
ECHO source :: Source Directory (drive:\path or \\server\share\path).
ECHO i.e. %0 drive:\path
ECHO Or   %0 \\server\share\path
GOTO :EOF