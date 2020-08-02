FROM php:7.4-apache

ENV TZ 'America/Havana'
RUN echo $TZ > /etc/timezone

# 1. intalando paquetes de desarrollo y extensiones
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
      procps \
      nano \
      git \
      unzip \
      libicu-dev \
      zlib1g-dev \
      libxml2 \
      libxml2-dev \
      libreadline-dev \
      supervisor \
      cron \
      libzip-dev \
      libpq-dev \
      librabbitmq-dev \
      nodejs \
      npm \
      tzdata \
    && pecl install amqp \
    && docker-php-ext-configure intl \
    && docker-php-ext-install \
      pdo \
      pdo_pgsql \
      sockets \
      intl \
      opcache \
      zip \
    && docker-php-ext-enable amqp \
    && rm -rf /tmp/* \
    && rm -rf /var/list/apt/* \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean
    
RUN rm /etc/localtime && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && dpkg-reconfigure -f noninteractive tzdata    

# 2. configuracion de apache + raíz del documento
RUN a2dissite 000-default.conf
COPY ./docker/symfony.conf /etc/apache2/sites-available/symfony.conf
COPY ./docker/symfony-ssl.conf /etc/apache2/sites-available/symfony-ssl.conf
RUN a2ensite symfony.conf && a2ensite symfony-ssl
# 2.1 Copiar los certificado
COPY ./docker/ssl-cert-domain.pem /etc/ssl/certs/ssl-cert-domain.pem
COPY ./docker/ssl-cert-private.key /etc/ssl/private/ssl-cert-private.key
COPY ./docker/cloudflare.crt /etc/ssl/certs/cloudflare.crt

# 3. habilitar módulos apache
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod headers

# 4. comience con la configuración básica de php
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# 5. composer
#COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
#RUN chmod +x /usr/bin/composer

# 6. copiando los archivos
COPY . /var/www/html

# 7. intalando composer y npm
#RUN cd /var/www/html && composer install
#RUN cd /var/www/html/metronic_assets/tools && npm i && npm run build

# 8. dando permisos a la carpeta de storage
#RUN chmod -R 755 /var/www/html/storage

# 9. Cambiando el propietario de los ficheros a www-data:www-data
RUN chown -R www-data:www-data /var/www/html

COPY ./docker/crontab /etc/crontab
ADD ./docker/docker-entrypoint.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh
ENTRYPOINT ["init.sh"]

# 10. exponiendo el puerto 80 y 443 del contenedor
EXPOSE 80 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
