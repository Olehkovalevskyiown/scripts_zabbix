#!/bin/bash

res="`ps -aux|grep  pm2-zabbix|grep su| wc -l`"
if [ "$res" = "1" ]; then
  echo OK
else
  nohup su bitrix -c "LOG_LEVEL=debug pm2-zabbix --hostname:dev.asna.ru --monitor" >> /var/log/noda_monitoring &
fi
