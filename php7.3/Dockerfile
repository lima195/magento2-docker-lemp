FROM php:7.3-fpm

RUN useradd -m john \
    && echo "john:john" | chpasswd \
    && adduser john sudo \
    && adduser john www-data

ARG DEBIAN_FRONTEND=noninteractive

ENV HOME /home/john

# Get repository and install wget and vim
RUN apt-get update && apt-get install --no-install-recommends -y \
        wget \
        vim \
        git \
        apt-utils \
        openssh-server \
        unzip

##
# PHP
##

# Install PHP extensions deps
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        zlib1g-dev \
        libicu-dev \
        g++ \
        unixodbc-dev \
        libxml2-dev \
        libaio-dev \
        freetds-dev \
        libssl-dev \
        libxslt-dev \
        libwebp-dev \
        libpng-dev \
        libonig-dev \
        libzip-dev \
        librabbitmq-dev \
        libssh-dev \
        libxpm-dev \
        openssl

# Configure PHP extensions
RUN docker-php-ext-configure gd \
    --with-gd \
    --with-webp-dir \
    --with-jpeg-dir \
    --with-png-dir \
    --with-zlib-dir \
    --with-xpm-dir \
    --with-freetype-dir

# Install docker php extensions
RUN docker-php-ext-install \
    iconv \
    mbstring \
    bcmath \
    xsl \
    intl \
    gd \
    mysqli \
    pdo_mysql \
    soap \
    zip \
    xmlrpc \
    opcache \
    sockets

# Install pecl packages
RUN pecl install -f \
    amqp \
    mcrypt \
    xdebug

# Enable docker php extensions
RUN docker-php-ext-enable \
    mcrypt \
    amqp \
    sockets \
    bcmath \
    xdebug

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer self-update 1.10.19 \
    && composer global require hirak/prestissimo --no-plugins --no-scripts \
    && composer require --dev mage2tv/magento-cache-clean

##
# Mailhog
##

# Install mailhog
RUN apt-get -y install golang-go \
    && go get github.com/mailhog/MailHog

# Install mhsendmail
RUN go get github.com/mailhog/mhsendmail \
    && ln -s  ~/go/bin/mhsendmail /usr/bin/mhsendmail

# Install node and npm
# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN mkdir /usr/local/nvm

# update the repository sources list
# and install dependencies
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get -y autoclean

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION v14.16.0

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

## add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

## Install npm
RUN apt-get install -y npm

##
# Owner Permissions
##

## Fixing owner permissions
RUN chown -R john:john $HOME

# Clean repository
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER john