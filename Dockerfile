FROM php:7.4-apache

ENV TZ 'America/Havana'
RUN echo $TZ > /etc/timezone

# 1. intalando paquetes de desarrollo y extensiones
RUN apt-get update && apt-get upgrade -y 

# 2. configuracion de apache + raíz del documento
RUN a2dissite 000-default.conf
COPY ./docker/symfony.conf /etc/apache2/sites-available/symfony.conf
COPY ./docker/symfony-ssl.conf /etc/apache2/sites-available/symfony-ssl.conf
RUN a2ensite symfony.conf && a2ensite symfony-ssl
# 2.1 Copiar los certificado
COPY ./docker/ssl-cert-domain.pem /etc/ssl/certs/ssl-cert-domain.pem
COPY ./docker/ssl-cert-private.key /etc/ssl/private/ssl-cert-private.key
COPY ./docker/cloudflare.crt /etc/ssl/certs/cloudflare.crt
# 2.2 habilitar módulos apache
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod headers

# 4. comience con la configuración básica de php
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# 6. copiando los archivos
COPY . /var/www/html

# 9. Cambiando el propietario de los ficheros a www-data:www-data
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
