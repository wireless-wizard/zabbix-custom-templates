#================================================================================================================================================================
# Title:		CountFilesInDDXQueue.ps1
#
# Author:		Nathan J. Schuetz
#
# Description:	To monitor a DDX Router queue to see how many files are in there in a given window of time.
# 
#
# Created:		06/24/2024
# Modified:		06/24/2024
# Status:		Working
#================================================================================================================================================================

# Declare Veribles
#===================
$counter = 0
$filesToCheck = 'E:\Dash\ddx\Router\Incoming'  # Path to the Dash DDX file dump for processing


# Set the operating directory to the one that I need to watch.
cd $filesToCheck

# Check to see if the there are any files
$counter = (Get-ChildItem -File | Measure-Object).Count

# Display results
Write-Host $counter