#Get-Software.ps1 version 0.1
#Author robert.cortese@va.gov
#Synopsis: Gets a list of installed software on computers in an OU and outputs the results to a file for each computer.
#Usage: Change the Searchbase on line 7 to match the OU you would like to scan.  Mine is provided as an example.


$servers = get-adcomputer -Filter * -Searchbase "CN OU goes here" -ResultSetSize 10| foreach { $_.Name }
foreach($Server in $Servers) {
if(Test-Connection $Server -Count 1 -Quiet){
$status='True'
$software = get-wmiobject win32_product -ComputerName $server -EA SilentlyContinue | foreach { $_.Name }| Out-File .\$server.txt -NoClobber
Write-Host $server,$software -ForegroundColor Green
}else {$status='False'
Write-Host $server is Offline -ForegroundColor Red
}
}
