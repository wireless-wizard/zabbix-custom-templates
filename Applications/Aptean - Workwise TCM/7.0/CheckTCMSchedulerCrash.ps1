#===================================================================================================
# Tytle: 		CheckTCMSchedulerCrash.ps1
# Author: 		Nathan J. Schuetz
#
# Description:	Check for any TCM logs greater than the $sizeThreshold and send the information Back
#				to Zabbix.
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

# Display the count of files found
$fileCount = $files.Count
Write-Host $fileCount