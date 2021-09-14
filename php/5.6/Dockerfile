FROM php:5.6-fpm

RUN useradd -m john \
    && echo "john:john" | chpasswd \
    && adduser john sudo \
    && adduser john www-data

ARG DEBIAN_FRONTEND=noninteractive

ENV HOME /home/john

# Get repository and install wget and vim
RUN apt-get update \
        && apt-get install --no-install-recommends -y \
        apt-utils \
        wget \
        vim \
        git \
        apt-utils \
        unzip

##
# PHP
##

# Install PHP extensions dependences
RUN apt-get install --no-install-recommends -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        zlib1g-dev \
        libicu-dev \
        g++ \
        unixodbc-dev \
        libxml2-dev \
        libaio-dev \
        libmemcached-dev \
        freetds-dev \
        libssl-dev \
        openssl

# Install PHP extensions
RUN docker-php-ext-install \
    iconv \
    mbstring \
    intl \
    mcrypt \
    gd \
    mysqli \
    pdo_mysql \
    soap \
    zip \
    xmlrpc

# Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer self-update 1.10.19 \
    && composer global require hirak/prestissimo --no-plugins --no-scripts


# PHPUnit
RUN wget https://phar.phpunit.de/phpunit.phar -O /usr/local/bin/phpunit \
    && chmod +x /usr/local/bin/phpunit

# Xdebug
RUN pecl install xdebug-2.5.5 \
  && docker-php-ext-enable xdebug
  
## Fixing owner permissions
RUN chown -R john:john $HOME

# Clean repository
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER john
