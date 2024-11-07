#===================================================================================================
# Tytle: 		CheckTCMSchedulerCrashDetail.ps1
# Author: 		Nathan J. Schuetz
#
# Description:	Check for any TCM logs greater than the $sizeThreshold and send the information Back
#				to Zabbix in the form of a log so detail can be shown in Zabbix.
#
#
# Date Created: 	9/03/2024
# Date Modified:	9/03/2024
# Status:			Working
#===================================================================================================

# Declorations
#====================
$directory = "C:\Users\[TCMServerUser]\AppData\Roaming\WorkWiseInc\TCM\V10.2\Log" 	# Define the directory to search.  Tipiclly this is the logged in user that the scheduler is logged into so replace [TCMServerUser] with your user.
$sizeThreshold = 500MB  															# Define the file size threshold (500 MB = 500 * 1MB)

# Search for files larger than 500 MB
$files = Get-ChildItem -Path $directory -Recurse -File | Where-Object { $_.Length -gt $sizeThreshold }

# Display the results in a table
$files | Select-Object FullName, @{Name="Size (MB)";Expression={ "{0:N2}" -f ($_.Length / 1MB) }} | 
Format-Table -AutoSize
