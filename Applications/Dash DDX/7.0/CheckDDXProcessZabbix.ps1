#================================================================================================================================================================
# Title:		CheckDDXProessZabbix.ps1
# Author:		Nathan J. Schuetz
# Description:	To monitor a Dash DDX Router process to make sure it is running
# Reference:	"Count the total process from a remote machine Oliver Lipkau 
#				https://social.msdn.microsoft.com/Forums/en-US/4f2b43ba-67dd-4482-8318-7aea5f0ade42/count-the-total-process-from-a-remote-machine?forum=scripting
#
# Created:		6/21/2024
# Modifyed:		6/24/2024
# Status:		Working
#================================================================================================================================================================

# Declare Veribles
#===================
$serviceArray = Get-WMIObject -Class win32_process|where{$_.name -like "*ddxrouter*"} 
[Int]$Count = 0

# Get information and count the running processes
#==================================================
$serviceArray | % {
  $serviceinfo | select name, state, status
  $Count++
}
# Display count
#================
Write-Host $Count