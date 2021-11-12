#!/usr/bin/env bash

BIEA_Y=`mysql -uroot -p'yfO112Sx6I' -e "use bitrix; SELECT COUNT(*) FROM b_iblock_element WHERE ACTIVE='Y';" | sed -n '2p' > /etc/zabbix/tmp/biblock_element_Y` 

BIEA_N=`mysql -uroot -p'yfO112Sx6I' -e "use bitrix; SELECT COUNT(*) FROM b_iblock_element WHERE ACTIVE='N';" | sed -n '2p' > /etc/zabbix/tmp/biblock_element_N`

BCP=`mysql -uroot -p'yfO112Sx6I' -e ' use bitrix; SELECT COUNT(1) FROM b_catalog_price;' | sed -n '2p' > /etc/zabbix/tmp/bcatalog_price`

BIL=`mysql -uroot -p'yfO112Sx6I' -e ' use bitrix; SELECT COUNT(1) FROM b_iblock_element;' | sed -n '2p' > /etc/zabbix/tmp/biblock_element`

