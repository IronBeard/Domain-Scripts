@Echo Off

REM Author:       Gareth
REM Date:         Friday, 12 August 2012
REM Description:  This script creates the required network drives on a machine.
REM Notes:  

REM Standard windows net use
@Echo Creating Shares
net use B: "\\Heracles\DVD"
net use M: "\\Dionysus\Video\Movies"
net use N: "\\Dionysus\Video\TV"
net use S: "\\Heracles\Converted DVD"
net use U: "\\Zeus\Photos"
net use V: "\\Zeus\Music Videos"
net use W: "\\Zeus\MP3"
net use X: "\\Zeus\Documents"
net use Y: "\\Zeus\Backups"

REM VBScript
REM Set objNetwork = CreateObject("WScript.Network")
REM objNetwork.MapNetworkDrive "S:" , "\\server\shared\finance"

REM Powershell
REM (New-Object -ComObject WScript.Network).MapNetworkDrive("S:", “\\Server\shared\finance”)
