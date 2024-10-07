#!/bin/bash
a=`netstat -tlpn |grep :16443|grep -v grep|wc -l`
if [ $a -eq 0 ]; then
   systemctl start haproxy
   sleep 3
   if [ $a -eq 0 ]; then
      systemctl stop keepalived
   fi
fi