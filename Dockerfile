FROM php:8.1-fpm-alpine

WORKDIR /app

RUN apk update
RUN apk add $PHPIZE_DEPS libzip-dev linux-headers git zip openssh

RUN docker-php-ext-install opcache
# Setup opcache
ADD docker/opcache.ini /usr/local/etc/php/conf.d/99-opcache.ini

# Install Datadog
RUN apk add libexecinfo
RUN curl -LO https://github.com/DataDog/dd-trace-php/releases/latest/download/datadog-setup.php
RUN php datadog-setup.php --php-bin=all

RUN mkdir -p -m 0600 /root/.ssh && ssh-keyscan gitlab.com >> /root/.ssh/known_hosts

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY composer.json .
COPY composer.lock .

RUN composer install --no-dev --no-autoloader --no-scripts

COPY --chown=www-data:www-data . /app

RUN composer du -o


