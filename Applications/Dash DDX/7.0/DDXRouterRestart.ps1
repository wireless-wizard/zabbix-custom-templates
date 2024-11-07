#================================================================================================================================================================
# Title:		DDXRouterRestart.ps1
# Author:		Nathan J. Schuetz
# Description:	To force a restart to the DDX Router upon detection that the process is hung. This will need to be setup as a Scheduled Task with no triggers in
#				Windows Task Scheduler called "Restart_DDX" and have it run "whether user is logged on or not" and "Run with highest privliges"
#
# Created:		06/25/2024
# Modifyed:		07/15/2024
# Status:		Working
#================================================================================================================================================================
# Declorations
$scriptToRun = 'E:\Dash\ddx\Bin\Server'	# Location of the DDX Server installation

# Switch to the proper directory
cd $scriptToRun


# Run the DDX startup batch file.
cmd.exe /c 'Startall.bat'