#Bulk Driver Update
#Copies drivers over to a list of computers and installs all the INF's         
param( 
[String] $ServerList)
$source =  "C:\SWSetup\SP98887"
$destination = "c$\SWSetup\SP98887"
$Servers=Get-Content $ServerList 
foreach($Server in $Servers){ 
copy-item $source -Destination \\$server\$destination -Recurse
Invoke-Command -Computername $Server -Scriptblock {C:\Windows\System32\pnputil.exe /i /a C:\SWSetup\SP98887\Graphics\*.inf}
}
