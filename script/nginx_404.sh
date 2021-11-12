si='60'
etal='0'
timr=$(date +"%s")
dt=$(date +%d/%b/%Y)
dt_min=$(date +%H:%M)
currenttime=$(($timr - $si))
rfs=$(date -d@$currenttime +"%H:%M")
rfs2=$dt':'$rfs

cat /dev/null > /etc/zabbix/tmp/nginx_404

err_asna=`cat /var/log/nginx/asna.ru_access.log | grep "$rfs2" | grep ' 404 ' | wc -l`
echo $err_asna > /etc/zabbix/tmp/nginx_404

err_terminal=`cat /var/log/nginx/terminal.asna.ru_access.log | grep "$rfs2" | grep ' 404 ' | wc -l`
echo $err_terminal >> /etc/zabbix/tmp/nginx_404

err_aptfarma=`cat /var/log/nginx/aptfarma.ru_access.log | grep "$rfs2" | grep ' 404 ' | wc -l`
echo $err_aptfarma >> /etc/zabbix/tmp/nginx_404


