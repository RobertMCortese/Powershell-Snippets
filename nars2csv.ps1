#HTML parser I wrote to convert a directory of HTML files to a CSV.

#Defines the source of the report

$requestnum = gc -path 'c:\oit\reqnum.txt'

Foreach ($request in $requestnum){
$report = "S:\somepath\$request*.html"

#Begin Parsing.  
$content = gc -path $report -raw | 
# Not needed, just get rid of it
ForEach-Object {$_ -Replace "<html><head><title>Network Account Access</title></head><body><p><h2>Network Access Request System</h2>",""} |
#2 email fields both named "email"  Fixed it to help variable it later
ForEach-Object {$_ -Replace '(<br />Email: <a href=)(.*?)(>)',"<br />Requester Email: <a href="} |
#Manually get rid of the email tag to preserve juicy center
ForEach-Object {$_ -Replace '(<a href="mailto)(.*?)(>)',""} |
ForEach-Object {$_ -Replace '(?<=<br />Requester:)Title(?=<br />Department:)',"Requester Title"} |
#Manually get rid of href tag to get to the juicy center
ForEach-Object {$_ -Replace "<a href=",""} |
#Replace unix style CRLF's with double LF's  Dboule LF's seemed to work better.
ForEach-Object {$_ -Replace "`r`n","`n`n"} |
#Preserve BR formatting
ForEach-Object {$_ -Replace "<br />", "`n"} | 
#Preserve <h5> formatting
ForEach-Object {$_ -Replace "</h5>", "`n"} |
#Replace all other HTML Tags
ForEach-Object {$_ -replace '<[^>]+>',''} |
#Cleanup on the confirm URL.
ForEach-Object {$_ -Replace ">Click here to confirm processing",""} |
#More cleanup on confirm URL
ForEach-Object {$_ -Replace '\(IT ONLY!\)',""} |
#More Cleanup on confirm URL.
ForEach-Object {$_ -Replace '"https','ConfirmURL: "https'} |
#I thought the / was causing issues.
ForEach-Object {$_ -Replace "Branch / Headquarters:","Headquarters:"} 



$content |
out-file c:\oit\test.txt

#This section uses [regex] to find matching values and puts them into variables.

$ID = [regex]::Match($content, '(?<=ID: )(.*)(?=)' ) | Select Value
$Site = [regex]::Match($content, '(?<=Site: )(.*)(?=)' ) | Select Value
$Request_Type = [regex]::Match($content, '(?<=Request Type: )(.*)(?=)' ) | Select Value
$Requester = [regex]::Match($content, '(?<=Requester: )(.*)(?=)' ) | Select Value
$Req_Department = [regex]::Match($content, '(?<=Department: )(.*)(?=)' ) | Select Value
$Req_Phone = [regex]::Match($content, '(?<=Phone Number: )(.*)(?=)' ) | Select Value
$Req_Email = [regex]::Match($content, '(?<=Requester Email: )(.*)(?=)' ) | Select Value
$Last = [regex]::Match($content, '(?<=Last: )(.*)(?=)' ) | Select Value
$First = [regex]::Match($content, '(?<=First: )(.*)(?=)' ) | Select Value
$Middle = [regex]::Match($content, '(?<=Middle: )(.*)(?=)' ) | Select Value
$Title = [regex]::Match($content, '(?<=Title: )(.*)(?=)' ) | Select Value
$SSN = [regex]::Match($content, '(?<=SSN: )(.*)(?=)' ) | Select Value
$DOB = [regex]::Match($content, '(?<=DOB: )(.*)(?=)' ) | Select Value
$Company = [regex]::Match($content, '(?<=Company: )(.*)(?=)' ) | Select Value
$City = [regex]::Match($content, '(?<=City: )(.*)(?=)' ) | Select Value
$State = [regex]::Match($content, '(?<=State: )(.*)(?=)' ) | Select Value
$Zip = [regex]::Match($content, '(?<=Zip: )(.*)(?=)' ) | Select Value
$Office = [regex]::Match($content, '(?<=Office: )(.*)(?=)' ) | Select Value
$Phone = [regex]::Match($content, '(?<=Phone: )(.*)(?=)' ) | Select Value
$Gender = [regex]::Match($content, '(?<=Gender: )(.*)(?=)' ) | Select Value
$StartDate = [regex]::Match($content, '(?<=Start Date: )(.*)(?=)' ) | Select Value
$EmployeeStatus = [regex]::Match($content, '(?<=Status: )(.*)(?=)' ) | Select Value
$Headquarters = [regex]::Match($content, '(?<=Headquarters: )(.*)(?=)' ) | Select Value
$WaiverDate = [regex]::Match($content, '(?<=Waiver Date: )(.*)(?=)' ) | Select Value
$BILevel = [regex]::Match($content, '(?<=BI Level: )(.*)(?=)' ) | Select Value
$TMSPrivacy = [regex]::Match($content, '(?<= \(10176\) Completed On: )(.*)(?=)' ) | Select Value
$TMSNeo = [regex]::Match($content, '(?<=\(Trainee / NEO etc.\) Completed On: )(.*)(?=)' ) | Select Value
$Interruption = [regex]::Match($content, '(?<=Interruption?: )(.*)(?=)' ) | Select Value
$EmployeeType = [regex]::Match($content, '(?<=Employee Type: )(.*)(?=)' ) | Select Value
$ContractorNumber = [regex]::Match($content, '(?<=Contractor #: )(.*)(?=)' ) | Select Value
$Service = [regex]::Match($content, '(?<=Service: )(.*)(?=)' ) | Select Value
$TNL = [regex]::Match($content, '(?<=T&L: )(.*)(?=)' ) | Select Value
$MailCode = [regex]::Match($content, '(?<=Mail Code: )(.*)(?=)' ) | Select Value
$Supervisor = [regex]::Match($content, '(?<=Supervisor: )(.*)(?=)' ) | Select Value
$SupervisorsPhone = [regex]::Match($content, '(?<=Supervisors Phone#: )(.*)(?=)' ) | Select Value
$AccountTypesNeeded = [regex]::Match($content, '(?<=Account Types Needed: )(.*)(?=)' ) | Select Value
$Folders = [regex]::Match($content, '(?<=Folders: )(.*)(?=)' ) | Select Value
$FolderAccessLevel = [regex]::Match($content, '(?<=Folder Access Level: )(.*)(?=)' ) | Select Value
$ADSecMail = [regex]::Match($content, '(?<=Active Directory Sec / Mail: )(.*)(?=)' ) | Select Value
$VistATemplate = [regex]::Match($content, '(?<=VistA Template: )(.*)(?=)' ) | Select Value
$DegreeField = [regex]::Match($content, '(?<=Degree Field: )(.*)(?=)' ) | Select Value
$DEANum  = [regex]::Match($content, '(?<=DEA#: )(.*)(?=)' ) | Select Value
$EXP = [regex]::Match($content, '(?<=EXP: )(.*)(?=)' ) | Select Value
$NPI = [regex]::Match($content, '(?<=NPI: )(.*)(?=)' ) | Select Value
$Takefilesupontermination = [regex]::Match($content, '(?<=Take files upon termination: )(.*)(?=)' ) | Select Value
$Comments = [regex]::Match($content, '(?<=Comments: )(.*)(?=)' ) | Select Value
$Servicesection = [regex]::Match($content, '(?<=Section: )(.*)(?=)' ) | Select Value

$AttribCreator = [regex]::Match($content, '(?<=Creator).+?(?=Date)' ) | Select Value
$AttribDateEntered = [regex]::Match($content, '(?<=Date Entered )(.*)(?=)' ) | Select Value


$AttribMultiSignOn = [regex]::Match($content, '(?<=Mult Sign-on).+?(?=Fileman)' ) | Select Value
$AttribFilemanCodes = [regex]::Match($content, '(?<=Fileman codes)(.*)(?=)' ) | Select Value

$AttribTimeout = [regex]::Match($content, '(?<=Time-Out).+?(?=Type)' ) | Select Value  
$AttribTypeAhead = [regex]::Match($content, '(?<=Type-ahead)(.*)(?=)' ) | Select Value

$Creator = [regex]::Match($content, '(?<=Creator).+?(?=Date)' ) | Select Value
$DateEntered = [regex]::Match($content, '(?<=Date Entered )(.*)(?=)' ) | Select Value





$ConfirmURL = [regex]::Match($content, '(?<=ConfirmURL: )(.*)(?=)' ) | Select Value

# This was fun, Secondary menu is on multiple lines, but it's enclose in brackets so at least I got thrown a bone here :)
$Secondarymenu = [regex]::Matches($content, '(?<=\[).+?(?=\])' ) |  ForEach-Object {$_.Value}

#Printing Variables for testing.
$ID
$Site
$Request_Type
$Requester
$Req_Department
$Req_Phone
$Req_Email
$Last
$First
$Middle
$Title
$SSN
$DOB
$Company
$City
$State
$Zip
$Office
$Phone
$Gender
$StartDate
$EmployeeStatus
$Headquarters
$WaiverDate
$BILevel
$TMSPrivacy
$TMSNeo
$Interruption
$EmployeeType
$ContractorNumber
$Service
$TNL
$MailCode
$Supervisor
$SupervisorsPhone
$AccountTypesNeeded
$Folders
$FolderAccessLevel
$ADSecMail
$VistATemplate
$DegreeField
$DEANum
$EXP
$NPI
$Takefilesupontermination
$Comments
$ServiceSection
$Secondarymenu
$ConfirmURL

#If you're trying to run this code delete everything below, WIP.

$csvobject = [pscustomobject]@{
Requestid =  $ID.value
Site = $Site.value
Request_Type = $Request_Type.value
Requester = $Requester.value
Req_Department = $Req_Department.value
Req_Phone = $Req_Phone.value
Req_Email = $Req_Email.value
Last = $Last.value
First = $First.value
Middle = $Middle.value
Title = $Title.value
SSN = $SSN.value
DOB = $DOB.value
Company = $Company.value
City = $City.value
State = $State.value
Zip = $Zip.value
Office = $Office.value
Phone = $Phone.value
Gender = $Gender.value
StartDate = $StartDate.value
EmployeeStatus = $EmployeeStatus.value
Headquarters = $Headquarters.value
WaiverDate = $WaiverDate.value
BILevel = $BILevel.value
TMSPrivacy = $TMSPrivacy.value
TMSNeo = $TMSNeo.value
Interruption = $Interruption.value
EmployeeType = $EmployeeType.value
ContractorNumber = $ContractorNumber.value
Service = $Service.value
TNL = $TNL.value
MailCode= $MailCode.value
Supervisor = $Supervisor.value
SupervisorPhone = $SupervisorsPhone.value
AccountTypesNeeded = $AccountTypesNeeded.value
Folders = $Folders.value
FolderAccessLevel = $FolderAccessLevel.value
ADSecMail = $ADSecMail.value
VistATemplate = $VistATemplate.value
DegreeField = $DegreeField.value
DEANum = $DEANum.value
EXP = $EXP.value
NPI = $NPI.value
Takefilesupontermination = $Takefilesupontermination.value
Comments = $Comments.value
ServiceSection = $ServiceSection.value
Secondarymenu = $Secondarymenu.value
ConfirmURL = $ConfirmURL.value
}

$csvobject | export-csv c:\oit\nars2csvtest3.csv -append
}
