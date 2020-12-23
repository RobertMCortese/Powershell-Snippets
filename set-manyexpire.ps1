# Update Account expire dates from CSV.
#Uses SamAccountname as the unique identifier.
#Example CSV below, edit as needed.

#$USERS = Import-CSV C:\oit\ps1\accountexpire\accountexpire.csv

#$USERS|Foreach{
#Set-ADAccountExpiration -Identity $_.samaccountname $_.expiredate
#}
$date = "11/30/2020 00:00:00"
Import-Csv 'C:\oit\ps1\accountexpire\accountexpire.csv' | ForEach-Object { Set-ADAccountExpiration -Identity $_.samaccountname  $date }
