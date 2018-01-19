<#
.SYNOPSIS
    Deny Itanium Updates in WSUS.
.DESCRIPTION
    The script will deny all of the Itanium Updates on the WSUS server. This needs to be run on the
    server in an administator session.
.NOTES
    File Name      : WSUSDenyItaniumUpdates.ps1
    Author         : Gareth Philpott
    Date           : 08/01/2018
    Prerequisite   : PowerShell V2 over Vista and upper.
    Copyright 2015 - Gareth Philpott
.EXAMPLE
    WSUSDenyItaniumUpdates
.LINK
#>

Get-WsusUpdate | Where-Object {$_.update.title -ilike "*itanium*" -or $_.update.title -ilike "*ia64*"} | Deny-WsusUpdate