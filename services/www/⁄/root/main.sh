#!/bin/bash
#-------------------------------------------------------------------------8<-------------------------------------------------------------------------
cd /root
rm -rf portal
mkdir portal
cd portal
git init
git pull https://80b72d58e6590479ba3741e90c9f3422d4a35cbc@github.com/cnam-recolnat/portal.git
cd sources/html2/
#-------------------------------------------------------------------------8<-------------------------------------------------------------------------
npm install
#-------------------------------------------------------------------------8<-------------------------------------------------------------------------
nohup npm start &
#-------------------------------------------------------------------------8<-------------------------------------------------------------------------
echo "root:abracadabra" | chpasswd
exec /usr/sbin/sshd -D
#-------------------------------------------------------------------------8<-------------------------------------------------------------------------