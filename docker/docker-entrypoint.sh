#!/bin/bash
chmod +x /etc/crontab
crontab /etc/crontab
service cron reload
service cron restart
chmod +x /var/www/html/docker/scrip.sh