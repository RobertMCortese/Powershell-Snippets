#gets the mac addr of computers i a searchbase.

$servers = get-adcomputer -Filter * -Searchbase "some OU goes here." | foreach { $_.Name }

foreach($Server in $Servers) { 
if(Test-Connection $Server -Count 1 -Quiet){
$status='True'
$mac = get-wmiobject win32_networkadapter -ComputerName $server -EA SilentlyContinue | Where-Object {$_.Name -like '*ethernet*'} |foreach { $_.MACAddress }
Write-Host $server,$mac -ForegroundColor Green 
}
}else{$status='False'
}
