#!/bin/bash


dt=$(date '+%d/%b/%Y:%H:%M')

llll=`tail -n 5 /home/log/httpd/error_log | grep "PHP Fatal error" > /root/send_fatal_mail.log`
lllll=`tail -n 5 /var/log/php/error.log | grep "PHP Fatal error" >> /root/send_fatal_mail.log`

lll=`tail -n 10 /root/send_fatal_mail.log | grep "PHP Fatal error" | wc -l`

