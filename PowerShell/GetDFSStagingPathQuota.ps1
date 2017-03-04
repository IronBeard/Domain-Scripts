<#
.SYNOPSIS
    Gets the DFS Staging Path Quota information fromt the Domain.
.DESCRIPTION
    Gets the DFS Staging Path Quota for all DFS servers in the Domain and shows the values in a table.

    From https://technet.microsoft.com/library/dn465158.aspx
.NOTES
    File Name      : GetDFSStagingPathQuota.ps1
    Author         : Gareth Philpott
    Date           : 10/03/2017
    Prerequisite   : PowerShell V2 over Vista and upper.
    Copyright 2017 - Gareth Philpott
.EXAMPLE
    GetDFSStagingPathQuota
.LINK
 
#>

Get-DfsrMembership -GroupName * -ComputerName * | Select-Object -Property ComputerName, GroupName, FolderName, ContentPath, StagingPathQuotaInMB, ConflictAndDeletedQuotaInMB | Format-Table