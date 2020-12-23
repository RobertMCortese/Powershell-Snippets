# Powershell-Snippets
Various Bits of powershell I created for doing work stuff.

**CIPC-Remote_install.ps1**

Copies and installs the Cisco IP Communicator softphone to a client and runs the MSI installer.

**Force-many-pwdchng.ps1**

Forces a list of users to change their password next logon.

**Get-Shortcut.ps1**

Turns .lnk files into powershell objects so you can export them into a CSV.  Useful if you're changing shortcuts and want to look for duplicates.

**One-Button-Gui-Macro.ps1**

This is some borrowed code from several places that I made my own. Creates a gui with a single button. Pressing the button activates a window and sends a sequence of keypresses to it.

**bulk-driverupdate.ps1**

Copies a directory of drivers (like a driverpack from dell) to a target machine, then installs all of them. Sometimes needed post imaging.

**bulk-scansoftversion.ps1**

Scans an OU for software installed on computers, and makes a list for each computer.

**get-byLastFirst.ps1**

Use a list to search AD for users with matching displaynames

**get-datedLogins.ps1**

Used to find accounts that haven't logged in x number of days.

**get-macaddr.ps1**

Gets the MAC addresses for computers in an OU.

get-many-lastpass.ps1

get-mass-uninstall.ps1

**get-oldprofilefolders.ps1**

Scans computers in an OU for c:\users profile folders unused in a long time

**get-printlog.ps1**

Gets a printlog from an AD print server, helps map users to printjobs

get-software-report.ps1

**nars2csv.ps1**

Converts local HTML files to CSV.  Heavy use of regex and customPSobject

**one-line-searchandreplace-attribute.ps1**

Example of how to search/replace a misspelled AD attribute.

**rm-many-groups.ps1**

Script to remove a user from a list of groups.

**set-group-bulk.ps1**

Script that reads in a list of users to be added to a single group.

**set-many-disable.ps1**

Script to bulk disable users

**set-many-enable.ps1**

Script to bulk enable many users

**set-many-update.ps1**

Script to update many users (set-aduser)

**set-manyexpire.ps1**

Script to set expiry date of many AD accounts.

