#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo 'requires root access to install';
    exit
fi


cd /root
git clone https://github.com/KentVejrupMadsen/Folding-Service.git

cd Folding-Service

git checkout publish
git pull

cd code
chmod 755 start.sh
chmod 755 stop.sh

crontab -l < cron.cfg

echo '0 21 * * * /root/Folding-Service/start.sh' >> cron.cfg
echo '0 6 * * * /root/Folding-Service/stop.sh' >> cron.cfg
crontab cron.cfg

rm cron.cfg