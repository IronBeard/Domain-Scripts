<#
.SYNOPSIS
    Renames photos and videos with the pattern used by DropBox.
.DESCRIPTION
    .
.NOTES
    File Name      : DropboxPhotoRename.ps1
    Author         : Gareth Philpott
    Date           : 05/03/2017
    Prerequisite   : PowerShell V2 over Vista and upper.
    Copyright 2017 - Gareth Philpott
.EXAMPLE
    DropboxPhotoRename -Source "E:\Temp\Camera Pictures\" -Destination "E:\Photos\Holidays" -Filter "*.mov", "*.mpg", "*.jpg", "*.aae", "*.png"
.LINK
 
.PARAMETER Source
    The name of the VM Host(s) to retrieve the VM list from. Default: HERA, POSEIDON
.PARAMETER Destination
    The name of the VM Host(s) to retrieve the VM list from. Default: HERA, POSEIDON
.PARAMETER Filter
    The name of the VM Host(s) to retrieve the VM list from. Default: HERA, POSEIDON
#>

param(
    $Source = "E:\Temp\Camera Pictures",
    $Destination = "E:\Temp\Camera Pictures 2", 
    $Filter = @("*.mov", "*.mpg", "*.jpg", "*.aae", "*.png")
)

Write-Host "Copying From: " $Source
Write-Host "Copying To:   " $Destination

# Retrieve all files from Source folder and pipe them to copy
# the tick is needed to allow the loop to start on the next line
Get-ChildItem $Source -include $Filter -recurse | foreach `
{
    # Dropbox uses lowercase for the extension
    $Extension = $_.Extension.ToLower()
    # Build new file name string (syntax: new Destination folder + year-month-date hours.minutes.seconds + oldname.extension)
    $DestinationName = $Destination +'\'+ $_.LastWriteTime.ToString("yyyy-MM-dd HH.mm.ss") + $Extension

    #############################################################################

    If (Test-Path $DestinationName)
    {
        $i = 0
        While (Test-Path $DestinationName)
        {
            $i += 1
            $DestinationName = $Destination +'\'+ $_.LastWriteTime.ToString("yyyy-MM-dd HH.mm.ss") + "-$i" + $Extension
        }
    }
    Else
    {
        New-Item -ItemType File -Path $DestinationName -Force
    }

    #############################################################################

    Write-Host $DestinationName
    # Copy Source file to new file name
    copy-item -literalpath $_.Fullname -Destination $DestinationName -Force
}