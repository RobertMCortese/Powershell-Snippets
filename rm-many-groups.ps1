#removes a user from multple AD groups read from a list.
$groups = gc c:\oit\groups.txt
foreach ($group in $groups){
Remove-adgroupmember -identity "$group" -Members usernamegoeshere
}
