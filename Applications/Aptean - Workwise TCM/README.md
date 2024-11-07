## Aptean Workwise TCM Server Template

This template is for monitoring critical TCM services spicificly TCM 10.2 to keep the server operational.  I personally run into a number of situations where monitoring was required for a few areas and not monitoring them has caused major issues when using this product.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Check TCM Scheduler Crash|<p>Pull TCM Log status via a PowerShell Item on the Zabbix Agent UserParameter.</p>|`Zabbix agent`|CheckTCMSchedulerCrash<p>Update: 1h</p>|
|Check TCM Scheduler Crash Detail|<p>Pull files that are larger than 500mb and show there location via a PowerShell Item on the Zabbix Agent UserParameter.</p>|`Zabbix agent`|CheckTCMSchedulerCrashDetail<p>Update: 1h</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Log Greater than 500 Mb (TCM Scheduler Crash Detected)|<p>Alert the admins to close down the TCM Scheduler</p>|<p>**Expression**: last(/DBQ Windows TCM Check/CheckTCMSchedulerCrash,#1)>0</p><p>**Recovery expression**: </p>|High|
|Log Greater than 500 Mb (TCM Scheduler Crash Detected L2)|<p>Escalate the problem and notify the admins to close down the TCM Scheduler</p>|<p>**Expression**: last(/DBQ Windows TCM Check/CheckTCMSchedulerCrash,#1)>1</p><p>**Recovery expression**: </p>|Disaster|

## Installation

First import the template.

Then you will need to create a UserPerameter in the Zabbix agent config file for this to work.  I personally used the following UserPerameter in the zabbix_agent2.conf file:

```
UserParameter=CheckTCMSchedulerCrash,powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\CheckTCMSchedulerCrash.ps1"
UserParameter=CheckTCMSchedulerCrashDetail,powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\CheckTCMSchedulerCrashDetail.ps1"
```

For more details regarding UserParameteres look at the Zabbix Documentation: https://www.zabbix.com/documentation/current/en/manual/config/items/userparameters
