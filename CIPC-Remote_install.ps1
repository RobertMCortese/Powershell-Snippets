# Cisco IP Communicator remote install script
# Purpose: Remotely install Cisco IP Communicator for a remote user.
# Run under admin/Zero token
# Change the line "$source =  $source =  "C:\OIT\CiscoIPCommunicatorSetup\CiscoIPCommunicatorSetup.msi""
# To where the install MSI is actually located. UNC paths are supported
# Usage Example.
# ipcominstall.ps1 -TargetSystem Pal-LT123456 -Targetuser VHAPALsomeuser
# Author: Robert.Cortese@va.gov
#################################################################################################################   

param($TargetSystem, $TargetUser)
$source =  "C:\oit\ps1\CiscoIPInstall\msi\"
$destination = "C$\oit\ps1\CiscoIPInstall\"
copy-item $source -Destination \\$TargetSystem\$destination -Recurse
write-host "Now installing on $TargetSystem for $Targetuser"
Invoke-Command -ComputerName $TargetSystem -ScriptBlock {C:\windows\system32\msiexec.exe /i c:\oit\ps1\CiscoIPInstall\CiscoIPCommunicatorSetup.msi /qb FREEFORMDEVICENAME="$using:Targetuser" TFTP1=”1.2.3.4” TFTP2=”5.6.7.8”}
