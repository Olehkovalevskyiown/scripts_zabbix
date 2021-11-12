#!/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
cd /home/popuk/mysql_status/
fil=`ls mysql_status_* -t | head -n 1`

loc=`cat $fil | grep "Waiting for table metadata lock" | wc -l` 
echo $loc
