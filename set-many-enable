#script to import samaccountnames from a CSV file and enable the accounts.

$USERS = Import-CSV C:\oit\ps1\disable-users\20200623-search.csv
 
$USERS|Foreach{
enable-ADAccount -Identity $_.samaccountname 
} 
