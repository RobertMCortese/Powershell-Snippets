#Queries Samaccountnames for the date password was last set, outputs to gridview.
$users=gc 'c:\oit\names.txt'
$process = foreach ($user in $users){
    get-aduser $user -properties * | select name,samaccountname,userprincipalname,enabled,PasswordLastSet 
}
$process | out-gridview
