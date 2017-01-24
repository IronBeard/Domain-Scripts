<#
.SYNOPSIS
    Sets the DFS Staging Path Quota to the correctly calculated value on the local machine.
.DESCRIPTION
    Sets the DFS Staging Path Quota to the correctly calculated value, this is calculated from the 32 largest files in the replicated folders. This is designed to run only on the local machine due to
    inconsistencies and speed in calculating directory sizes over the network and thus will need to be run on all members of the replication group.

    From https://technet.microsoft.com/library/dn465158.aspx
.NOTES
    File Name      : SetDFSStagingPathQuota.ps1
    Author         : Gareth Philpott
    Date           : 23/01/2017
    Prerequisite   : PowerShell V2 over Vista and upper.
    Copyright 2017 - Gareth Philpott
.EXAMPLE
    SetDFSStagingPathQuota
.LINK
 
#>

# Default Staging size to prevent a quota being set too low
$DefaultSmallestStagingPathQuotaInMB = 4096
$ConflictAndDeletedQuotaInMB = 4096

# Get all of the local DFS shares on the machine
$DFSDirs = Get-DfsrMembership -GroupName * -ComputerName $env:computername | Select-Object -Property GroupName, FolderName, ContentPath #| Format-List

# Iterate through all of the returned replication groups to set the quotas
foreach ($i in $DFSDirs)
{
    # Get the 32 largest files in the replicated folder, this is done by first sorting the files by size and summing the first 32
    $DirectorySize = (Get-ChildItem $i.ContentPath -recurse –force | Sort-Object length -descending | select-object -first 32 | measure-object -property length -sum).sum /1mb
    # Round the result of the directory size to drop off the decimal places
    $RoundedDirectorySize = [math]::Round($DirectorySize)
    
    # If the rounded size is smaller than the default staging size then use that instead. This is to avoid issues with too small a value returned from the directory sizing for things like new replicated folders
    If ($RoundedDirectorySize -lt $DefaultSmallestStagingPathQuotaInMB){$RoundedDirectorySize = $DefaultSmallestStagingPathQuotaInMB}

    # Set the values for the staging and the conflicted/deleted quotas for the current replication group
    Set-DfsrMembership -GroupName $i.GroupName -ComputerName $env:computername -FolderName $i.FolderName -StagingPathQuotaInMB $RoundedDirectorySize -ConflictAndDeletedQuotaInMB $ConflictAndDeletedQuotaInMB -Force | Select-Object -Property GroupName, FolderName, ContentPath, StagingPathQuotaInMB, ConflictAndDeletedQuotaInMB | Format-List
}

# Return the full list of the replication groups across all machines for comparison
Get-DfsrMembership -GroupName * -ComputerName * | Select-Object -Property ComputerName, GroupName, FolderName, ContentPath, StagingPathQuotaInMB, ConflictAndDeletedQuotaInMB | Format-Table

Write-Output ''

Write-Output 'DFS Quota Comfiguration Complete.'