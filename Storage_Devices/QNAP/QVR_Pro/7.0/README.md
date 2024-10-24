# QVR Pro Application Monitoring

## Overview

This Template will moniter the service QVR Pro on QNAP NAS devices to insure that your service is running and not stopped.  I created this template due to the issues that I found when managing this service it would someties die on me and be off for an entire day before I noticed.

 


If you wish to see new items added please open an issue @ [wireless-wizard/zabbix-custom-templates @ GitHub](https://github.com/wireless-wizard/zabbix-custom-templates). All new updates will be released on github.



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$QVR_HOST}|<p>Hostname or IP of the QNAP NAS</p>|`65`|Text macro|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Get device data|<p>-</p>|`HTTP agent`|qvr.get_data<p>Update: 5m</p>|
|QVR Service Alive|<p>-</p>|`Dependent item`|service.alive<p></p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|QVR Service Offline|<p>An alert to inform that the QVR Service is down.</p>|<p>**Expression**: last(/QNAP QVR Pro Template/service.alive)<>200</p><p>**Recovery expression**: </p>|High|
