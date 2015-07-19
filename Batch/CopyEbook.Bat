@Echo Off

REM Author:       Gareth
REM Date:         Sunday, 6 November 2011
REM Source:       Zeus (D:\Ebook)
REM Destination:  Hera (D:\Ebook)
REM Description:  This script copies the EBooks stored on Zeus (D:\Ebook) to Hera (D:\Ebook) and is run from Hera.
REM Notes:        

SET vCopyName="%cd%\RCopy.bat"
SET vLogName=CopyEbookLog

CALL %vCopyName% "\\Zeus\Ebook" "\\Hera\Ebook" %vLogName%