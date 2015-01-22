#!/bin/bash
#-----------------------------------------------------------8<----------------------------------------------------------
service haproxy status && service haproxy start && service haproxy status && ps aux | grep haproxy
#-----------------------------------------------------------8<----------------------------------------------------------
cd etcd-v2.0.0-rc.1-linux-amd64 && nohup ./etcd &
#-----------------------------------------------------------8<----------------------------------------------------------
sleep 5
#-----------------------------------------------------------8<----------------------------------------------------------
nohup curl -L http://127.0.0.1:4001/v2/keys/myapp?wait=true\&recursive=true &
#-----------------------------------------------------------8<----------------------------------------------------------
nohup confd &
#-----------------------------------------------------------8<----------------------------------------------------------
echo "root:abracadabra" | chpasswd
exec /usr/sbin/sshd -D
#-----------------------------------------------------------8<----------------------------------------------------------