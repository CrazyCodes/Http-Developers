FROM php:7.0.9-fpm
MAINTAINER crazycodes <919342864@qq.com>

WORKDIR /mnt/app

ADD site.ini /usr/local/etc/php/conf.d

# 常用工具
RUN apt-get update && apt-get install -y git curl wget cron vim locales libfreetype6-dev mariadb-client \
  && docker-php-ext-install mysqli pdo_mysql

# 安装PHP Redis扩展
COPY ./ext/redis-3.1.4.tgz /home/redis-3.1.4.tgz

RUN pecl install /home/redis-3.1.4.tgz && echo "extension=redis.so"  > /usr/local/etc/php/conf.d/redis.ini