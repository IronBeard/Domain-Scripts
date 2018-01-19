<#
.SYNOPSIS
    Lists the BIOS Serial Number of the supplied machines.
.DESCRIPTION
    The script will return the BIOS Serial number for the supplied machines, this will work for both physical and virtual machines.
    It will filter out entries with a blank BIOSGUID, these do not appear to be valid VM's but exist in Windows 10 Hyper-V.
.NOTES
    File Name      : Get_MACAddress.ps1
    Author         : Gareth Philpott
    Date           : 27/12/2017
    Prerequisite   : PowerShell V2 over Vista and upper.
    Copyright 2015 - Gareth Philpott
.EXAMPLE
    Get_MACAddress -Machines "Machine1", "Machine2"
.LINK
 
.PARAMETER Machines
    The name of the Machines to retrieve the MAC from. Default: ZEUS, HERA, HEPHAESTUS
#>

param(
 $Machines = ("ZEUS", "HERA", "HEPHAESTUS")
)

ForEach($item in $Machines)
{
    Get-WmiObject -ComputerName $item -Namespace root\virtualization\v2 -class Msvm_VirtualSystemSettingData | Select-Object elementname, BIOSSerialNumber, BIOSGUID | Where-Object {$_.BIOSGUID -ne $null}
}