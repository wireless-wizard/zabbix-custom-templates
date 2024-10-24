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
