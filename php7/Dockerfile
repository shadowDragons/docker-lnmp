FROM php:7.1-fpm
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb http://mirrors.163.com/debian/ jessie main non-free contrib" >/etc/apt/sources.list && \
    echo "deb http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/debian/ jessie main non-free contrib" >>/etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libcurl4-nss-dev \
        libc-client-dev \
        libkrb5-dev \
        firebird2.5-dev \
        libicu-dev \
        libxml2-dev \
        libxslt1-dev \
        ssmtp \
        autoconf \
        zip \
        cron \
        git \
        libssh2-1-dev \
        librabbitmq-dev \
        librabbitmq1 \
        libmemcached-dev \
        libpq-dev


        
RUN docker-php-ext-install -j$(nproc) mcrypt \
    && docker-php-ext-install -j$(nproc) curl \
    && docker-php-ext-install -j$(nproc) mbstring \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-install -j$(nproc) interbase \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) soap \
    && docker-php-ext-install -j$(nproc) xmlrpc \
    && docker-php-ext-install -j$(nproc) xsl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap \
    && docker-php-ext-install mysqli pdo pdo_mysql pdo_pgsql \
    && docker-php-ext-install zip


RUN pecl install redis-3.1.3 \
    && docker-php-ext-enable redis

RUN pecl install memcached \
    && docker-php-ext-enable memcached

RUN pecl install channel://pecl.php.net/amqp-1.7.0alpha2 && echo        extension=amqp.so > /usr/local/etc/php/conf.d/amqp.ini

RUN  pecl install mongodb \
    && echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/ext-mongodb.ini \
