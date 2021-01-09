So yesterday a Tier3 team did a big goof at work.  We have a Microsoft Identity manager team that disabled about 561 accounts. At one point we were asked to ID the accounts.  I came up with this little bit of powershell that ID'd accounts modified in the last 24 and had an extensionattribute applied.  Saved the day.

$When = ((Get-Date).AddDays(-1)).Date
Get-ADUser -Filter {extensionAttribute4 -eq "Ourattribute" -and modified -ge $When} -Properties * -searchbase 'OU=oursupersecretou'| Select sAMAccountName, extensionAttribute4, modified | export-csv c:\oit\trainingdisable.csv -append
