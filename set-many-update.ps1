# Update Accounts from CSV.
#Uses SamAccountname as the unique identifier.
#Example CSV below, edit as needed.

$USERS = Import-CSV C:\oit\book1.csv
 
$USERS|Foreach{
Set-ADUSer -Identity $_.samaccountname -DisplayName $_.DisplayName -title $_.title -OfficePhone $_.officephone -Manager $_.manager -StreetAddress $_.streetaddress -City $_.city -PostalCode $_.postalcode -Department $_.Department -Office $_.Office
} 
