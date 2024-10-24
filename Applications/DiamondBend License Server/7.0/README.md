# DiamondBend License Server Application Monitoring

## Overview

This Template will moniter the service DiamondBend on Windows devices to insure that your service is running and not stopped.

 


If you wish to see new items added please open an issue @ [wireless-wizard/zabbix-custom-templates @ GitHub](https://github.com/wireless-wizard/zabbix-custom-templates). All new updates will be released on github.



## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Check DiamondBend Process|<p>Pull DiadmondBend status via a PowerShell Item on the Zabbix Agent UserParameter.</p>|`Zabbix agent`|CheckDiamondBendProessZabbix<p>Update: 1m</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|DiamondBend Service Offline|<p>Alert the admins to restart the service.</p>|<p>**Expression**: last(/DBQ DiamondBend Check/CheckDiamondBendProessZabbix,#3)=0</p><p>**Recovery expression**: </p>|High|

## Installation

First import the template.

Then you will need to create a UserPerameter in the Zabbix agent config file for this to work.  I personally used the following UserPerameter in the zabbix_agent2.conf file:

```
UserParameter=CheckDiamondBendProessZabbix,powershell -NoProfile -ExecutionPolicy bypass -File "C:\zabbix-agent-scripts\CheckDiamondBendProessZabbix.ps1"
```

For more details regarding UserParameteres look at the Zabbix Documentation: https://www.zabbix.com/documentation/current/en/manual/config/items/userparameters
