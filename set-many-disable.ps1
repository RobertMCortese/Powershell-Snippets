# Script imports a CSV of samaccountnames and disables them in AD.



$USERS = Import-CSV C:\oit\ps1\disable-users\disabled-20200708.csv
 
$USERS|Foreach{
Disable-ADAccount -Identity $_.samaccountname 
} 
