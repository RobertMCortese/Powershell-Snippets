#Mass uninstall by Robert Cortese
#Uninstalls software based on get-wmiobject win32_product name of software


#Uncomment line Below if you want to search and uninstall OU wide.
#$computerNames = get-adcomputer -Filter * -Searchbase "some CN OU" | foreach {$_.name}

#Uncomment line below if you wish to uninstall from a list of computers
#$computernames = gc c:\oit\ps1\somefile.txt

#App edit below with the appname
$appName = "Naughty software name"

Foreach $computer in $computerNames

Invoke-Command -ComputerName $computer-ScriptBlock {

    Get-WmiObject Win32_product | Where {$_.name -eq $using:appName} | ForEach {

        $_.Uninstall()

    }

}
