#!/bin/bash
#-----------------------------------------------------------8<----------------------------------------------------------
#api
wget server 172.17.0.9:8080

#www
wget server 172.17.0.6:3000
#-----------------------------------------------------------8<----------------------------------------------------------
haproxy -vv
#cp /root/haproxy.cfg /etc/haproxy/haproxy.cfg
haproxy -f /root/haproxy.cfg
#-----------------------------------------------------------8<----------------------------------------------------------
echo "root:abracadabra" | chpasswd
exec /usr/sbin/sshd -D
#-----------------------------------------------------------8<----------------------------------------------------------