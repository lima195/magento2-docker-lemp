FROM php:7.4-fpm

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

# Install PHP extensions dependences
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
        curl \
        openssl

# Configure PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-webp --with-jpeg 

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

##
# Node | Gulp | Grunt
##

ARG NODE_VERSION=9.11.2
ARG NODE_PACKAGE=node-v$NODE_VERSION-linux-x64
ARG NODE_HOME=/opt/$NODE_PACKAGE

ENV NODE_PATH $NODE_HOME/lib/node_modules
ENV PATH $NODE_HOME/bin:$PATH

RUN curl https://nodejs.org/dist/v$NODE_VERSION/$NODE_PACKAGE.tar.gz | tar -xzC /opt/

RUN npm install -g gulp
RUN npm install -g grunt

##
# Owner Permissions
##

## Fixing owner permissions
RUN chown -R john:john $HOME

# Clean repository
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER john
