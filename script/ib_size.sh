#!/bin/bash

loc=`cat /etc/my.cnf|grep datadir|awk '{print $3}'`
loc=${loc}'/ibdata1'
size=`du -b ${loc}|awk '{print $1}'`
echo $size
