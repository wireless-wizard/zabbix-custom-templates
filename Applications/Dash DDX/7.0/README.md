# Dash DDX Server Application Monitoring

## Overview

This Template will moniter the Dash DDX service on Windows devices to insure that your service is running properly.  I have had so many issues with this software where it would stop processing files until the entire service stack was restarted causing me many service calls.  I got very tired of it so I created this template and alert system to automaticly reboot the process without me being at my desk.

 

If you wish to see new items added please open an issue @ [wireless-wizard/zabbix-custom-templates @ GitHub](https://github.com/wireless-wizard/zabbix-custom-templates). All new updates will be released on github.



## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Count Files In DDX Queue|<p>Monitor how many DDX files are in the queue via a PowerShell Item on the Zabbix Agent UserParameter.</p>|`Zabbix agent`|CountFilesInDDXQueue<p>Update: 1s</p>|
|DDX Service running|<p>Monitor if the DDX Router Process is running via a PowerShell Item on the Zabbix Agent UserParameter.</p>|`Zabbix agent`|CheckDDXProcessZabbix<p>Update: 1m</p>|
|Oldest File in Queue|<p>Monitor if the DDX Router Process is running via a PowerShell Item on the Zabbix Agent UserParameter.</p>|`Zabbix agent`|DDXOldestFileDate<p>Update: 30s</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|DDX Process Not running|<p>Alert the admins when the Service has been offline for at least 3 mintues</p>|<p>**Expression**: avg(/Windows Dash DDX Check/CheckDDXProcessZabbix,4:now-3m)=0</p><p>**Recovery expression**: </p>|Disaster|
|Files stuck in DDX queue|<p>Alert the admins when there are files stuck in the DDX queue for 6 counts (around 3 mintues).</p>|<p>**Expression**: sum(/Windows Dash DDX Check/DDXOldestFileDate,#6)>=6</p><p>**Recovery expression**: </p>|High|

## Installation

First import the template.

Then you will need to create a UserPerameter in the Zabbix agent config file for this to work.  I personally used the following UserPerameter in the zabbix_agent2.conf file:

```
UserParameter=CountFilesInDDXQueue,powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\CountFilesInDDXQueue.ps1"
UserParameter=CheckDDXProcessZabbix,powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\CheckDDXProcessZabbix.ps1"
UserParameter=DDXOldestFileDate,powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\DDXOldestFileDate.ps1"
```

For more details regarding UserParameteres look at the Zabbix Documentation: https://www.zabbix.com/documentation/current/en/manual/config/items/userparameters

## Automation

If you want to make this process completely automated in the DDX restart there are some extra setup that needs to be done.

Zabbix 7.0 Alerts/Scripts

Create a new script with the following:
Name: Restart DDX process
Scope: Action Operation
Type: Script
Execute on: Zabbix Agent
Command:
```
powershell -NoProfile -ExecutionPolicy bypass Start-ScheduledTask -TaskName "Restart_DDX"
```
Description:
```
Restart the DDX Router service if it detects a hang in file processing.
```

I found by calling a Scheduled Task the user setup works much better.


Zabbix 7.0 Alerts/Actions/Trigger Actions

Create an Action with the following

Name: Restart DDX Service
Type of Calculation:  And 
Conditions:
|Type|Operator|Value|
|----|-----------|---------|
|Trigger|Equals|<p>Template - Windows Dash DDX Check:Files stuck in DDX queue</p>|
|Problem is suppressed|No||

Operations:
	Run script "Restart DDX Process" on current host (Start ImmedaDuration 9 mintues)
	Send message to users: whoever you want to see this notification. 
	
	
