# Edit for your OU and search filter as needed.
# Script will scan c:\users directories looking for old profile folders over 100 days old.
# You can see I used CIM instance at first, but when a domain profile is deleted, the old data remains and get-ciminstance has no idea it's there.
# Author: Robert.Cortese@VA.gov


$computers = get-adcomputer -Filter 'name -like "MPD-WS*"' -Searchbase "OU=Palo Alto (PAL),OU=VISN21,DC=v21,DC=med,DC=va,DC=gov" | foreach { $_.Name }
$Today = (Get-Date).Date
$MaxDaysOld = '0'

foreach($computer in $computers){
Write-Host "Scanning:" $computer -ForegroundColor Green
#$instances = Get-CimInstance -computername $computer -ClassName Win32_UserProfile -ErrorAction SilentlyContinue |
#    Where {(!$_.Special) -and ($_.LastUseTime -lt (Get-Date).AddDays(-5))} 

    $instances = get-childitem \\$computer\c$\users -ErrorAction SilentlyContinue |? {$_.psiscontainer -and $_.lastwritetime -le (get-date).adddays(-100)}
   
 
foreach($instance in $instances){
$results = [pscustomobject]@{ 

'pathinfo' = $instance.name
'lastused' = $instance.LastWriteTime
'computername' = $computer
}

$results | export-csv c:\oit\mpd-oldprofiles.csv -append

}

  }
