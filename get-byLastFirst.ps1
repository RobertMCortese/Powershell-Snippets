# Searches using concated Last, First, returns Samaccoutnames

import-csv C:\oit\master.csv 

ForEach-Object {Get-ADUser -Filter 'name -like "$name*"' -Searchbase "searchbasegoeshere" -Properties samaccountname,name,description,enabled | select samaccountname,name,description,enabled }
#` export-csv .\Task 4-20200708-search.csv -Append}


   
