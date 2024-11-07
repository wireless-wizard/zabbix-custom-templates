#================================================================================================================================================================
# Title:		DDXOldestFileDate.ps1 
# Author:		Nathan J. Schuetz
# Description:	To monitor the oldest date in a list of files to determin if the service has stopped.
#
# Created:		06/25/2024
# Modifyed:		06/27/2024
# Status:		Working
#================================================================================================================================================================

# Declare Veribles
#===================
$counter = 0
$filesToCheck = 'E:\Dash\ddx\Router\Incoming'	# Path to the Dash DDX file dump for processing

# Check to see if the there are any files
$counter = (Get-ChildItem -Path $filesToCheck -File | Measure-Object).Count

# Perform a check to see if files are stuck.
if ($counter -gt 0)
	{ 
		# If counter is greater than 0 display a 1
		Write-Host 1
	}
else
	{
		# If counter is 0 then dispaly a 0
		Write-Host 0
	}
