#Script to force a list of samaccount names to change password on next login.
$Users = gc 'C:\oit\names.txt'
foreach ($user in $users){
Set-ADUser -Identity $user -ChangePasswordAtLogon $true
}
