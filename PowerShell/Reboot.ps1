<#

Create a shortcut with the following Target:
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy ByPass -File {FileName}

Pin the shortcut to the Task Bar

To allow scripts to be run (http://stackoverflow.com/questions/4037939/powershell-says-execution-of-scripts-is-disabled-on-this-system):
Start PowerShell as Administrator
Set-ExecutionPolicy RemoteSigned

This can be tested using -WhafIf on the end of the Restart-Computer command
http://blog.pluralsight.com/test-powershell-with-whatif

#>

# https://technet.microsoft.com/en-us/library/ee177031.aspx
# http://blogs.technet.com/b/heyscriptingguy/archive/2015/06/20/powertip-use-powershell-to-get-computer-name.aspx
Write-Host "Rebooting" $env:computername

# https://technet.microsoft.com/en-us/library/hh849837.aspx
Restart-Computer