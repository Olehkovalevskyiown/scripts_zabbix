/etc/zabbix/script/iostat-collect.sh /etc/zabbix/tmp/iostat.out 60 &> /dev/null &
#/etc/zabbix/script/biblock.sh &> /dev/null &
/etc/zabbix/script/nginx_404.sh &> /dev/null &
/etc/zabbix/script/checksum_all.sh &> /dev/null &
#/etc/zabbix/script/nod_mon.sh &> /dev/null &
echo 1
