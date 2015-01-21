#!/bin/bash
#-----------------------------------------------------------8<----------------------------------------------------------
cd /root
mkdir -p portal && cd portal && git init
git pull https://80b72d58e6590479ba3741e90c9f3422d4a35cbc@github.com/cnam-recolnat/portal.git
cd seeds/api/
#-----------------------------------------------------------8<----------------------------------------------------------
echo $(java -version)
echo $(sbt -v)
#-----------------------------------------------------------8<----------------------------------------------------------
nohup sbt ~re-start > api.log &
tail -f api.log & until nc -z localhost 8080; do sleep 1; done
wget -v -nc -t 2 -T 333 localhost:8080/hello
#-----------------------------------------------------------8<----------------------------------------------------------
echo "root:abracadabra" | chpasswd
#-----------------------------------------------------------8<----------------------------------------------------------
ip=$(ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
echo "$ip is alive ! Still has to broadcast it to etcd..."
#-----------------------------------------------------------8<----------------------------------------------------------
exec /usr/sbin/sshd -D
#-----------------------------------------------------------8<----------------------------------------------------------