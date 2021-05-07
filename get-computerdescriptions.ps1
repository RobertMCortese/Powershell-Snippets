#Author robert.m.cortese
#What does this do?
#Get-Computerdescription takes a list of computernames and scans the c:\users directory for the most recently used profile
#which is normally named after a samaccountname. After that, it will do a get-aduser on that samccount name, pulling
#various bits of info on the user.  Info is then put into a CSV which can later be used with Set-adcomputer -description $description to 
#fill in the computers description.

$computers = gc C:\oit\ps1\desktops.txt
ForEach ($computer in $computers){
$lastuser = gci "\\$computer\c$\users" | sort LastWriteTime | select -last 1
$userinfo = get-aduser $lastuser.name -properties Name,telephoneNumber, Department  | select name, telephonenumber,department
$description =$userinfo.name, $userinfo.telephonenumber, $userinfo.department 
$separator = " "
$data = [pscustomobject]@{ 
Computer = $Computer
Description = [string]::Join($separator,$description)
}

$data | export-csv c:\oit\computerinfo-paldesktops.csv -append -NoTypeInformation
$data 
}
