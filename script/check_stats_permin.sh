si='60'
etal='0'
timr=$(date +"%s")
dt=$(date +%d/%b/%Y:)
dt_min=$(date +%H:%M)
currenttime2=$(($timr - $si))
rfs=$(date -d@$currenttime2 +"%H:%M")
rfs2=$dt''$rfs


res_check=`cat /var/log/nginx/asna.ru_access.log | grep "$rfs2" | grep import/check_statuses.php| wc -l`
echo $res_check
