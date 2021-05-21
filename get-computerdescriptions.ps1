#Author robert.cortese@va.gov
#What does this do?
#Get-Computerdescription takes a list of computernames and scans the c:\users directory for the most recently used profile
#which is normally named after a samaccountname. After that, it will do a get-aduser on that samccount name, pulling
#various bits of info on the user.  Info is then put into a CSV which can later be used with Set-adcomputer -description $description to 
#fill in the computers description.

$computers = gc C:\oit\stk-filtered.txt
ForEach ($computer in $computers){
$lastuser = gci "\\$computer\c$\users" | sort LastWriteTime | select -last 1
$ram = Get-WMIObject -computername $computer -class Win32_PhysicalMemory | Measure-Object -Property capacity -Sum | select @{N="TotalRam"; E={[math]::round(($_.Sum / 1GB),2)}}
$makemodel = get-wmiobject -computername $computer win32_computersystem
$serial = get-wmiobject -computername $computer win32_bios
$OS = $(((gcim Win32_OperatingSystem -ComputerName $computer).Name).split('|')[0])
$mac = Get-WmiObject -computername $computer win32_networkadapterconfiguration | where-object {$_.description -like "*Intel*"} | select macaddress
$userinfo = get-aduser $lastuser.name -properties Name,telephoneNumber, Department  | select name, telephonenumber,department
$description =$OS, "$($ram.totalram)GB RAM","$($makemodel.Manufacturer +" " + $makemodel.model)","$("Serial: " + $Serial.SerialNumber)","$("MAC: " + $Mac.macaddress)", "$(" Contact: " + $userinfo.name + " Phone:" + $userinfo.telephonenumber + " Department: "+$userinfo.department)", "Updated: 5/19/2021" 
$separator = " | "
$data = [pscustomobject]@{ 
Computer = $Computer
Description = [string]::Join($separator,$description)
}

$data | export-csv c:\oit\computerinfo-stk.csv -append -NoTypeInformation
$data 
}
