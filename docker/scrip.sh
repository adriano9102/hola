 #!/bin/sh # 
cd /var/www/html
#php /var/www/html/bin/console app:autopost
echo "script ejecutado - $(date)" >> /var/www/html/docker/log-script.txt
