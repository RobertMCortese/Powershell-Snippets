$computer = "computername or get-adcomputer goes here"
$nettest = Test-NetConnection $computer| select PingSucceeded

if($nettest -eq 'True'){
$model = get-wmiobject -computername $computer win32_computersystem | select model 
$serial = get-wmiobject -computername $computer win32_bios | select serialnumber  
$querysession = query session /server:$computer | select-string 'console'
$username = [regex]::Match($querysession, '(?s)(?<=console           ).+?(?=              )' ) | Select Value
$nameemail = get-aduser $username.value -properties mail | select name,mail
set-adcomputer $computer -Description "$nameemail.name $nameemail.mail $serial.serialnumber $model.model"
$computer | export-csv c:\oit\success.csv -append
}
Else {
export-csv c:\oit\fail.csv -append
}
