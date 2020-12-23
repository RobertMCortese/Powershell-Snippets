#Synopsis
#Palo Alto was spelled as "Palo Alro" on multiple accounts
#Wanted to challenge myself by making an easy to read one liner.
#Script looks for all matching accounts with "VA Palo Alro" in the physicaldeliveryofficename
#And replaces the attribute on the corresponding accounts.

get-aduser -filter 'physicaldeliveryofficename -like "VA Palo Alro*"' | foreach-object { set-aduser -identity $_.samaccountname -Office "VA Palo Alto Health Care System"}
