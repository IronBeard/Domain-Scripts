@echo off

REM Author:       Gareth
REM Date:         Monday, 16 September 2013
REM Description:  This script sets up and executes a GUI-less defrag for maintenance.
REM Notes:        IF "%DRIVE:~-1%"==":" SET DRIVE=%DRIVE:~0,-1% checks the input
REM               parameter to see if it is a : and if so removes it.

REM error checks
IF (%1)==() GOTO ERROR_drive_not_found

SET DRIVE=%1

title Defragging %1:\

REM Removes the trailing character, in this case a :
IF "%DRIVE:~-1%"==":" SET DRIVE=%DRIVE:~0,-1%

%SystemRoot%\System32\Defrag.exe %DRIVE%:
GOTO :EOF

:ERROR_drive_not_found
ECHO The drive letter to be defragged needs to be added
ECHO i.e. %0 C
GOTO :EOF