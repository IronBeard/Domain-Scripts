<#
.SYNOPSIS
    Performs a planned failover of the VMs from the supplied list of hosts.
.DESCRIPTION
    Fails over all VMs from the current primary host to the replica. The primary and replica are defined by the individual virtual machine replication settings.
.NOTES
    File Name      : Failover-VMs.ps1
    Author         : Gareth Philpott
    Date           : 13/05/2015
    Prerequisite   : PowerShell V2 over Vista and upper.
    Copyright 2015 - Gareth Philpott
.EXAMPLE
    Failover-VMs -Hosts "VMHost1", "VMHost2"
.LINK
 
.PARAMETER Hosts
    The name of the VM Host(s) to retrieve the VM list from. Default: HERA, POSEIDON
#>

param(
 $Hosts = ("ZEUS", "HERA")
)

Write-Output 'Getting VMs from the following Hosts.'
Write-Output $hosts

$computers = ForEach($item in $Hosts)
{Get-VMReplication -ComputerName $item | Where {$_.Mode -Match "Primary"} | Select -Property Name, PrimaryServer, ReplicaServer}

Write-Output ''

Write-Output 'Got the following VMs.'
Write-Output $computers | Select -Property Name | % { $_.Name }

workflow Test-Workflow
{
param($vms)
    Write-Output ''
    Write-Output 'Stopping VMs...'
    ForEach -Parallel ($item in $vms)
    {
      Write-Output "Stopping $($item.Name)"
      Stop-VM –VMName $item.Name –ComputerName $item.PrimaryServer
    }

    Write-Output ''
    Write-Output 'Failing VMS over to Replica Server...'
    ForEach -Parallel ($item in $vms)
    {
      Write-Output "Preparing to fail $($item.Name) from $($item.PrimaryServer) to $($item.ReplicaServer)"
      Start-VMFailover –VMName $item.Name –ComputerName $item.PrimaryServer –Prepare -confirm:$false
      Write-Output "Switching $($item.Name) to $($item.ReplicaServer)"
      Start-VMFailover –VMName $item.Name –ComputerName $item.ReplicaServer -confirm:$false
      Write-Output "Resetting Replication Partner for $($item.Name) to $($item.PrimaryServer)"
      Set-VMReplication -VMName $item.Name -ComputerName $item.ReplicaServer –Reverse
    }

    Write-Output ''
    Write-Output 'Restarting VMs...'
    ForEach -Parallel ($item in $vms)
    {
      Write-Output "Restarting $($item.Name)"
      Start-VM –VMName $item.Name –ComputerName $item.ReplicaServer
    }
}

Test-Workflow $computers

Write-Output ''

Write-Output 'Failover complete.'