check=`pt-table-checksum  --replicate-check-only --no-check-binlog-format --databases=bitrix localhost -ubitrix_106 -p'58_KI9-Pf' | grep -v "Differences" | grep -v "TABLE CHUNK CNT_DIFF CRC_DIFF CHUNK_INDEX LOWER_BOUNDARY UPPER_BOUNDARY" | wc -l`
echo /dev/null > /etc/zabbix/tmp/checksum
echo $check > /etc/zabbix/tmp/checksum
