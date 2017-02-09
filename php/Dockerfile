FROM hub.c.163.com/library/php:5.6-fpm
RUN apt-get update
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN apt-get install -y libmcrypt-dev
RUN apt-get install -y libpng12-dev
RUN apt-get install -y librabbitmq-dev
RUN docker-php-ext-install -j$(nproc) iconv mcrypt
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-install pdo_mysql

RUN pecl install redis-3.1.0 \
    && docker-php-ext-enable redis

RUN curl -sS https://pecl.php.net/get/amqp-1.6.0beta3.tgz -o amqp-1.6.0beta3.tgz \
    && mkdir -p /usr/src/php/amqp \
    && tar -xof amqp-1.6.0beta3.tgz -C /usr/src/php/amqp --strip-components=1 \
    && rm amqp-1.6.0beta3.tgz \
    && cd /usr/src/php/amqp \
    && phpize \
    && ./configure \
    && make \
    && make install \
    && echo "extension=amqp.so" > /usr/local/etc/php/conf.d/ext-amqp.ini

