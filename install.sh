#!/bin/bash

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