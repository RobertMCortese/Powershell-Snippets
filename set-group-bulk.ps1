#Bulk adds a list of users to a single group
$users = gc 'c:\oit\users.txt'
foreach ($user in $users) {
    Add-ADGroupMember -Identity groupname $user
    }
