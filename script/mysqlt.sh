cat /dev/null > /etc/zabbix/tmp/mysql_tmp
mysql_thread=`mysql --defaults-file=/var/lib/zabbix/.my.cnf -e 'show status' | grep "Threads_connected" | awk '{print $2}'`
echo $mysql_thread > /etc/zabbix/tmp/mysql_tmp

cat /dev/null > /etc/zabbix/tmp/mysql_tmp2
orders_all=`mysql --defaults-file=/var/lib/zabbix/.ubitrix.cnf -e 'use bitrix; select count(*) FROM b_sale_order as o WHERE o.DATE_INSERT > NOW() - INTERVAL 1 HOUR'`
res_all=`echo $orders_all | awk '{print $2}'`
echo $res_all > /etc/zabbix/tmp/mysql_tmp2
cat /dev/null > /etc/zabbix/tmp/mysql_tmp3
orders_term=`mysql --defaults-file=/var/lib/zabbix/.ubitrix.cnf -e 'use bitrix; select count(*) FROM b_sale_order as o WHERE o.DATE_INSERT > NOW() - INTERVAL 1 HOUR AND LID="te";'`
res_term=`echo $orders_term | awk '{print $2}'`
echo $res_term > /etc/zabbix/tmp/mysql_tmp3

cat /dev/null > /etc/zabbix/tmp/mysql_tmp4
orders_site=`mysql --defaults-file=/var/lib/zabbix/.ubitrix.cnf -e 'use bitrix; select count(*) FROM b_sale_order as o WHERE o.DATE_INSERT > NOW() - INTERVAL 1 HOUR AND (LID="s1" OR LID="s2");'`
res_site=`echo $orders_site | awk '{print $2}'`
echo $res_site > /etc/zabbix/tmp/mysql_tmp4
