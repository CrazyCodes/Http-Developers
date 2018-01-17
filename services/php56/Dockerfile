FROM php:5.6-fpm
MAINTAINER crazycodes <919342864@qq.com>

WORKDIR /mnt/app

ADD site.ini /usr/local/etc/php/conf.d

COPY php-fpm.conf /usr/local/etc/php-fpm.conf
COPY php-fpm.conf.default /usr/local/etc/php-fpm.conf.default

# 常用工具
RUN apt-get update \
	&& apt-get install -y git curl wget cron vim locales libfreetype6-dev libjpeg62-turbo-dev libpng12-dev libmcrypt-dev mariadb-client \
	&& docker-php-ext-install mysqli pdo_mysql mysql \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd 

# 安装PHP Redis扩展
COPY ./ext/redis-3.1.4.tgz /home/redis-3.1.4.tgz

RUN pecl install /home/redis-3.1.4.tgz && echo "extension=redis.so"  > /usr/local/etc/php/conf.d/redis.ini