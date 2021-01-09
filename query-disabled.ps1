$When = ((Get-Date).AddDays(-1)).Date
Get-ADUser -Filter {extensionAttribute4 -eq "Ourattribute" -and modified -ge $When} -Properties * -searchbase 'OU=oursupersecretou'| Select sAMAccountName, extensionAttribute4, modified | export-csv c:\oit\trainingdisable.csv -append
