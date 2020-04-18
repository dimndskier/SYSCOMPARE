#!/usr/bin/bash 


status="running"
while [ ${status} == "running" ]; do
  for ct in \` \\ \| \/ - \| \/ \+; do
    ps -ef | egrep "rpm|sha512sum" | egrep -v "SYS|stats.sh|grep" 2>&1 >/dev/null  || status="dead"
    echo -en "\b$ct"
    sleep 1
  done
done
echo -e "\b\n"
