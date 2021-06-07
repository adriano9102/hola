<<<<<<< HEAD
FROM php:7.4-apache

ENV TZ 'America/Havana'
RUN echo $TZ > /etc/timezone

# 1. intalando paquetes de desarrollo y extensiones
RUN apt-get update && apt-get upgrade -y 

# 2. configuracion de apache + raíz del documento
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# 3. habilitar módulos apache
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod headers

# 4. comience con la configuración básica de php
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# 9. Cambiando el propietario de los ficheros a www-data:www-data
RUN chown -R www-data:www-data /var/www/html

# 10. exponiendo el puerto 80 y 443 del contenedor
=======
FROM wordpress:5.6.0-php7.4-apache
RUN rm /etc/apt/preferences.d/no-debian-php && apt-get update && apt-get install -y libxml2-dev php-soap && docker-php-ext-install soap
# 10. exponiendo el puerto 80 y 443 del contenedor..
>>>>>>> 7a1e3b3dc427483bfdcd2f8d8e57244b9e8d34b7
EXPOSE 80 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
