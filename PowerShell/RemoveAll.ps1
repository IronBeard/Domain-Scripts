<#
.SYNOPSIS
    Deletes the items from the specified list.
.DESCRIPTION
    Iterates throught the supplied list and deletes all matching items.
.NOTES
    File Name      : RemoveAll.ps1
    Author         : Gareth Philpott
    Date           : 26/10/2015
    Prerequisite   : PowerShell V2 over Vista and upper.
    Copyright 2015 - Gareth Philpott
.EXAMPLE
    RemoveAll
.LINK
 
#>

# Grab the items to be deleted from the domain compare scripts
# ctrl + H and replace the start of the line up to the \\
# ^[^\\]*
# ctrl + H and replace \r\n with
# ",\r\n"

# Need to add a parameter so that the directory list can be sent as a parameter instead of hard coded.
$myArray =  "\\Hera\Apps\PortableApps\AntRenamerPortable\App\AntRenamer\Languages\German.lng.old",
            "\\Hera\Apps\PortableApps\AntRenamerPortable\App\AppInfo\Launcher\splash.jpg"

Remove-Item $myArray –whatif
# Remove-Item $myArray #-recurse