#Scans computers for a specific software and version.
param( 
[String] $ServerList, 
[String] $OutputPath) 

$Servers=Get-Content $ServerList 
foreach($Server in $Servers){ 
if(Test-Connection $Server -Count 1 -Quiet){ 
$status='True' 
Write-Host $server is Online -ForegroundColor Green 
$CIPC = get-wmiobject -computername $server win32_product | Where-Object{$_.Name -eq "Cisco IP Communicator"} | select version
}else{$status='False' 
Write-Host $server is Offline -ForegroundColor Red 
} 
New-Object -TypeName psobject -Property @{ 
ComputerName=$Server 
Status=$status
CIPC =$CIPC 
}|select ComputerName,Status,CIPC|Export-Csv -Path $OutputPath\pingresult.csv -Append -NoTypeInformation 
}
