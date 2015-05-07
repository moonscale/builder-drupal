FROM php:5.6-fpm

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        git \
        unzip \
    && docker-php-ext-install zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN cd /usr/local && git clone http://github.com/drush-ops/drush && cd drush && composer install

RUN ln -s /usr/local/drush/drush /usr/local/bin/drush

RUN echo "date.timezone = UTC" > /usr/local/etc/php/conf.d/date.ini
