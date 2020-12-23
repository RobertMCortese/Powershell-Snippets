#Searches AD for accounts that haven't logged in $numberofdays with option to disable.

# Get the Current Date  
#   
$CurrentDate=GET-DATE  
#  
# Number of Days to check back.    
#   
$NumberDays=30
#  
# Organizational Unit to search  
#  
$OU='OU=Users,OU=Palo Alto (PAL),OU=VISN21,DC=v21,DC=med,DC=va,DC=gov'  
#  
Import-Module ActiveDirectory 
GET-ADUSER -filter * -SearchBase $OU -properties LastLogonDate | where { $_.LastLogonDate.AddDays($NumberDays) -lt $CurrentDate } | Format-Table 
#  
# Add in a | DISABLE-ADAccount to AUTOMATICALLY Disable those accounts.  
# Line should read like this if you want to do that  
#  
# GET-ADUSER -filter * -SearchBase $OU -properties LastLogonDate | where { $_.LastLogonDate.AddDays($NumberDays) -lt $CurrentDate } | Disable-ADAccount 
