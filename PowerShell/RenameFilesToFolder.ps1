<#
.SYNOPSIS
    .
.DESCRIPTION
    .
.NOTES
    File Name      : RenameFilesToFolder.ps1
    Author         : Gareth Philpott
    Date           : 11/10/2020
    Prerequisite   : PowerShell V2 over Vista and upper.
    Copyright 2020 - Gareth Philpott
.EXAMPLE
    RenameFilesToFolder -Source "C:\Source" -Filter "*.mkv"
.LINK
 
.PARAMETER Source
     The source directory to recurively copy the files from.
.PARAMETER Dest
    The filter for the files.
#>

param(
 $Source = "",
 $Filter = ""
)

Get-ChildItem $Source -Filter $Filter -Recurse | Rename-Item -NewName {$_.Directory.Name+$_.Extension}
