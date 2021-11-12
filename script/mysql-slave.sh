#!/bin/bash
export LC_ALL=""
export LANG="en_US.UTF-8"
##### OPTIONS VERIFICATION #####
if [[ -z "$1" ]]; then
  exit 1
fi
##### PARAMETERS #####
METRIC="$1"
USER="${2:-user}"
PASS="${3:-pass}"
#
MYSQL="/usr/bin/mysql"
CACHE_TTL="55"
CACHE_FILE="/tmp/zabbix.mysql-slave.cache"
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
  DATACACHE=`${MYSQL} -u${USER} -p${PASS} --vertical -e "SHOW SLAVE STATUS" 2>&1`
  echo "${DATACACHE}" > "${CACHE_FILE}" # !!!
  chmod 640 "${CACHE_FILE}"
fi
#
RESULT=`cat "${CACHE_FILE}" | grep -i "${METRIC}" | awk -F": " '{print $2}' | head -n1`
#
if echo "${RESULT}" | grep -iwq "yes"; then
  echo "1"
elif echo "${RESULT}" | grep -iq -E "^(no|none|connecting|)$"; then
  echo "0"
else
  echo "${RESULT}"
fi
#
exit 0
