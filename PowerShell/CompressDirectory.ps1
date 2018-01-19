<#
.SYNOPSIS
    .
.DESCRIPTION
    .
.NOTES
    File Name      : CompressDirectory.ps1
    Author         : Gareth Philpott
    Date           : 06/01/2018
    Prerequisite   : PowerShell V2 over Vista and upper.
    Copyright 2015 - Gareth Philpott
.EXAMPLE
    CompressDirectory -Source "C:\Source" -Dest "C:\Dest"
.LINK
 
.PARAMETER Source
     The source directory to recurively copy the files from.
.PARAMETER Dest
    The destination for the files.
#>

param(
 $Source = "",
 $Dest = ""
)

# Move the files from the subdirectories to the destination directory
Get-ChildItem -Path $Source -Recurse -File | Move-Item -Destination $Dest

# Delete the now empty directories
Get-ChildItem -Path $Source -Recurse -Directory | Remove-Item