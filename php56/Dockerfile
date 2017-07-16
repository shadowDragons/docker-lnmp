FROM hub.c.163.com/library/php:7.0-fpm
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN apt-get install -y libmcrypt-dev
RUN apt-get install -y libpng12-dev
RUN apt-get install -y librabbitmq-dev
RUN apt-get install -y librabbitmq1

#RUN docker-php-ext-install -j$(nproc) iconv mcrypt
#RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
#RUN docker-php-ext-install -j$(nproc) gd
#RUN docker-php-ext-install pdo_mysql
#RUN docker-php-ext-install pcntl



#RUN docker-php-ext-install-pecl redis
#RUN php -m | grep redis

#RUN docker-php-ext-install-pecl amqp-1.9.1
#RUN php -m | grep amqp

#RUN docker-php-ext-install-pecl sockets
#RUN php -m | grep sockets

#RUN docker-php-ext-install-pecl swoole-1.9.16
#RUN php -m | grep swoole

RUN curl -sS https://pecl.php.net/get/amqp-1.9.1.tgz -o amqp-1.9.1.tgz
RUN mkdir -p /usr/src/php/amqp \
    && tar -xof amqp-1.9.1.tgz -C /usr/src/php/amqp --strip-components=1 \
    && rm amqp-1.9.1.tgz \
    && cd /usr/src/php/amqp \
    && phpize \
    && ./configure \
    && make \
    && make install \
    && echo "extensi on=amqp.so" > /usr/local/etc/php/conf.d/ext-amqp.ini
#RUN pecl install redis-3.1.2 \
#    && docker-php-ext-enable redis

#RUN docker-php-ext-install sockets \
#    && docker-php-ext-enable sockets

#RUN pecl install swoole-1.9.16 \
#    && docker-php-ext-enable swoole