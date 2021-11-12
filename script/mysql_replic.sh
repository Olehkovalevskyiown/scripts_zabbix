cons='Yes'
replic=`mysql --defaults-file=/var/lib/zabbix/.my.cnf -e 2>/dev/null 'show slave status\G;'| grep "Slave_IO_Running:" | awk '{print $2}'`
replic2=`mysql --defaults-file=/var/lib/zabbix/.my.cnf -e 2>/dev/null 'show slave status\G;'| grep "Slave_SQL_Running:" | awk '{print $2}'`

if [[ "$cons" == "$replic" ]]; then
if [[ "$cons" == "$replic2" ]]; then
m=2
else
m=0
fi
else
m=0
fi

echo $m

