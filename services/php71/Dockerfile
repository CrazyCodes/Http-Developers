FROM php:7.1.7-fpm
MAINTAINER crazycodes <919342864@qq.com>

WORKDIR /mnt/app

ADD site.ini /usr/local/etc/php/conf.d

COPY php-fpm.conf /usr/local/etc/php-fpm.conf
COPY php-fpm.conf.default /usr/local/etc/php-fpm.conf.default

# 常用工具
RUN apt-get update \
	&& apt-get install -y git curl wget cron vim locales libfreetype6-dev libjpeg62-turbo-dev libpng12-dev libmcrypt-dev mariadb-client \
	&& docker-php-ext-install mysqli pdo_mysql \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd 

# 安装PHP Redis扩展
COPY ./ext/redis-3.1.4.tgz /home/redis-3.1.4.tgz

RUN apt-get -y install python-setuptools
RUN easy_install supervisor


RUN pecl install /home/redis-3.1.4.tgz && echo "extension=redis.so"  > /usr/local/etc/php/conf.d/redis.ini
RUN pecl install swoole && echo "extension=swoole.so" > /usr/local/etc/php/conf.d/swoole.ini
RUN pecl install yaf && echo "extension=yaf.so" > /usr/local/etc/php/conf.d/yaf.ini

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
