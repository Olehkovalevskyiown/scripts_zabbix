#!/bin/bash
##### OPTIONS VERIFICATION #####
if [[ -z "$1" || -z "$2" ]]; then
  exit 1
fi
##### PARAMETERS #####
RESERVED="$1"
METRIC="$2"
#NC="/usr/bin/nc"
CACHE_TTL="55"
CACHE_FILE="/tmp/zabbix.memcache.cache"
EXEC_TIMEOUT="1"
NOW_TIME=`date '+%s'`
##### RUN ##### 
if [ -s "${CACHE_FILE}" ]; then
  CACHE_TIME=`stat -c"%Y" "${CACHE_FILE}"`
else
  CACHE_TIME=0
fi
DELTA_TIME=$((${NOW_TIME} - ${CACHE_TIME}))
#
if [ ${DELTA_TIME} -lt ${EXEC_TIMEOUT} ]; then
  sleep $((${EXEC_TIMEOUT} - ${DELTA_TIME}))
elif [ ${DELTA_TIME} -gt ${CACHE_TTL} ]; then
  echo "" >> "${CACHE_FILE}" # !!!
  DATACACHE=`echo -e "stats\nquit" | memcached-tool /home/run/memcached/memcached.sock stats`
  echo "${DATACACHE}" > "${CACHE_FILE}" # !!!
  chmod 640 "${CACHE_FILE}"
fi
#
cat "${CACHE_FILE}" | grep -i " ${METRIC} " | awk '{print $2}' | head -n1
#
exit 0
