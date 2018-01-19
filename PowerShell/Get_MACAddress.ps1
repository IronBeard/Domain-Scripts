<#
.SYNOPSIS
    Lists the MAC address of the supplied machines.
.DESCRIPTION
    The script will return the MAC Address for the supplied machines, this will work for both physical and virtual machines.
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
    The name of the Machines to retrieve the MAC from. Default: ZEUS, HERA
#>

param(
 $Machines = ("ZEUS", "HERA")
)

ForEach($item in $Machines)
{
    Get-WmiObject -ClassName Win32_NetworkAdapterConfiguration -Filter "IPEnabled='True'" -ComputerName $item | Select-Object -Property DNSHostName, MACAddress, Description
}