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
 $Filter = "",
 $trimLength = 100
)
# Original
#Get-ChildItem $Source -Filter $Filter -Recurse | Rename-Item -NewName {$_.Directory.Name+$_.Extension}

$tailRecursion = {
    param(
        $Path
    )
    foreach ($childDirectory in Get-ChildItem -Force -LiteralPath $Path -Directory) {
        & $tailRecursion -Path $childDirectory.FullName
    }
    $currentChildren = Get-ChildItem -Force -LiteralPath $Path
    $isEmpty = $currentChildren -eq $null
    if ($isEmpty) {
        Write-Verbose "Removing empty folder at path '${Path}'." -Verbose
        Remove-Item -Force -LiteralPath $Path
    }
}

# Testing 
Get-ChildItem $Source -Filter $filter -Recurse | %{Write-Host (Split-Path -Path ($_.DirectoryName) -Leaf)+$_.Extension}

# Rename folders longer than the configured maximum to prevent folder rename errors
$names = Get-ChildItem -Path $Source -Recurse -Directory
foreach($name in $names)
{
    if ($name.name.Length -gt $trimLength)
    {
        $newname = $name.name.Substring(0,$trimLength)
        Rename-Item $name.FullName -NewName $newname -Verbose
    }
}

# Rename files
Get-ChildItem $Source -Filter $filter -Recurse | Rename-Item -NewName { (Split-Path -Path ($_.DirectoryName) -Leaf)+$_.Extension}

# Move files - Make one line? Should be able to move the 2nd line up and drop the variable
$files = Get-ChildItem ($Source + "\*")
Get-ChildItem $files | Move-Item -Destination $Source

# Remove all of the (now) empty folders
& $tailRecursion -Path $Source
