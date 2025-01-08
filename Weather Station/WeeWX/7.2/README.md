# WeeWX Weather Station Template

## Overview

This template is used to monitor the WeeWX service via its web page.  I currently have this setup on a Raspberry PI B+ and it seams to work just fine.

Please note that this is still in devolopment and I have some bugs I still need to work out and more items to add to the README file.
 
If you wish to see new items added please open an issue @ [wireless-wizard/zabbix-custom-templates @ GitHub](https://github.com/wireless-wizard/zabbix-custom-templates). All new updates will be released on github.



## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Gethttpdata|<p>Pull the entire web page for processing.</p>|`HTTP agent`|Gethttpdata<p>Update: 5m</p>|
|Altitude|<p>Altitude</p>|`Dependent item`|Altitude<p>Regular Expression:  `<td class="label">Altitude<\/td>\s*<td class="data">([\d.]+)`  \1</p>|
|Barometer|<p>Barometer</p>|`Dependent item`|Barometer<p>Regular Expression:  `<td class="label">Barometer<\/td>\s*<td class="data">([\d.]+)`  \1</p>|


