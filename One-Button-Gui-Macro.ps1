#parts borrowed from unknown places on the web, but keystroke sending part is mine. Gui created using visual studio WPF forms.  
#Simple script that creates a gui that when pressed, activates a window and sends keystrokes to said window.

#Your XAML goes here :)

$inputXML = @"
<Window x:Name="The_900" x:Class="The_900.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:The_900"
        mc:Ignorable="d"
        Title="The 900" Height="199.864" Width="179363">
    <Grid>
        <Button x:Name="the900" Content="900 the user" HorizontalAlignment="Left" Margin="26,40,0,0" VerticalAlignment="Top" Width="115" Height="90"/>
    </Grid>
</Window>

"@ 
 
$inputXML = $inputXML -replace 'mc:Ignorable="d"','' -replace "x:N",'N' -replace '^<Win.*', '<Window'
[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
[xml]$XAML = $inputXML
#Read XAML
 
$reader=(New-Object System.Xml.XmlNodeReader $xaml)
try{
    $Form=[Windows.Markup.XamlReader]::Load( $reader )
}
catch{
    Write-Warning "Unable to parse XML, with error: $($Error[0])`n Ensure that there are NO SelectionChanged or TextChanged properties in your textboxes (PowerShell cannot process them)"
    throw
}
 
#===========================================================================
# Load XAML Objects In PowerShell
#===========================================================================
  
$xaml.SelectNodes("//*[@Name]") | %{"trying item $($_.Name)";
    try {Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name) -ErrorAction Stop}
    catch{throw}
    }
 
Function Get-FormVariables{
if ($global:ReadmeDisplay -ne $true){Write-host "If you need to reference this display again, run Get-FormVariables" -ForegroundColor Yellow;$global:ReadmeDisplay=$true}
write-host "Found the following interactable elements from our form" -ForegroundColor Cyan
get-variable WPF*
}
 
Get-FormVariables
 
#===========================================================================
# Use this space to add code to the various form elements in your GUI
#===========================================================================
                                                                    
     
#Reference 
 
#Adding items to a dropdown/combo box
    #$vmpicklistView.items.Add([pscustomobject]@{'VMName'=($_).Name;Status=$_.Status;Other="Yes"})
     
#Setting the text of a text box to the current PC name    
    #$WPFtextBox.Text = $env:COMPUTERNAME
     
#Adding code to a button, so that when clicked, it pings a system
# $WPFbutton.Add_Click({ Test-connection -count 1 -ComputerName $WPFtextBox.Text
# })
#===========================================================================
# Shows the form
#===========================================================================
write-host "To show the form, run the following" -ForegroundColor Cyan
'$Form.ShowDialog() | out-null'

$WPFthe900.Add_Click({

$wshell = New-Object -ComObject wscript.shell;
$wshell.AppActivate('Application Window Name goes here')
Sleep 1

Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("n")
Sleep .5
$wshell.SendKeys("{ENTER}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("900")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5
$wshell.SendKeys("{down}")
Sleep .5

$wshell.SendKeys("s")
Sleep .5
$wshell.SendKeys("{ENTER}")
Sleep .5
$wshell.SendKeys("ex")
Sleep .5
$wshell.SendKeys("{ENTER}")
Sleep 1
$wshell.SendKeys("ed")
Sleep .5
$wshell.SendKeys("{ENTER}")



})
$Form.ShowDialog() | out-null
