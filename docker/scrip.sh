 #!/bin/sh #
#php /var/www/html/bin/console app:autopost
exec echo "script ejecutado - $(date)" >> /var/www/html/docker/log-script.txt
