#================================================================================================================================================================
# Title:		CheckDiamondBendProessZabbix
# Author:		Nathan J. Schuetz
# Description:	To monitor a DiamondBend License process to make sure it is running
# Reference:	"Count the total process from a remote machine Oliver Lipkau 
#				https://social.msdn.microsoft.com/Forums/en-US/4f2b43ba-67dd-4482-8318-7aea5f0ade42/count-the-total-process-from-a-remote-machine?forum=scripting
# Created:		7/08/2024
# Modified:		10/24/2024
# Status:		Working
#================================================================================================================================================================
#Invoke-Command -ScriptBlock { get-wmiobject win32_process | where{ $_.name  -eq $process } | select name, __SERVER,@{n="owner";e={$_.getowner().user}}} | Format-Table name, PSComputerName, owner -AutoSize

# Declare Veribles
#===================
$serviceArray = Get-WMIObject -Class win32_process|where{$_.name -like "*callic*"} 
[Int]$Count = 0

# Get information and count the running processes
#==================================================
$serviceArray | % {
  $serviceinfo | select name, state, status
  $Count++
}
# Display count for zabbix
#==========================
Write-Host $Count