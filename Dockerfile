FROM wordpress:5.6.0-php7.4-apache
RUN rm /etc/apt/preferences.d/no-debian-php && apt-get update && apt-get install -y libxml2-dev php-soap && docker-php-ext-install soap
# 10. exponiendo el puerto 80 y 443 del contenedor
EXPOSE 80 443
