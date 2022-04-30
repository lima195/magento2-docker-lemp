FROM php:7.4-fpm
RUN apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev

RUN apt-get install --no-install-recommends -y libmcrypt-dev
RUN apt-get install --no-install-recommends -y zlib1g-dev
RUN apt-get install --no-install-recommends -y libicu-dev
RUN apt-get install --no-install-recommends -y g++
RUN apt-get install --no-install-recommends -y unixodbc-dev
RUN apt-get install --no-install-recommends -y libxml2-dev
RUN apt-get install --no-install-recommends -y libaio-dev
RUN apt-get install --no-install-recommends -y freetds-dev
RUN apt-get install --no-install-recommends -y libssl-dev
RUN apt-get install --no-install-recommends -y libxslt-dev
RUN apt-get install --no-install-recommends -y libwebp-dev
RUN apt-get install --no-install-recommends -y libonig-dev
RUN apt-get install --no-install-recommends -y libzip-dev
RUN apt-get install --no-install-recommends -y librabbitmq-dev
RUN apt-get install --no-install-recommends -y libssh-dev
RUN apt-get install --no-install-recommends -y curl

RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
	&& docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install -j$(nproc) mbstring
RUN docker-php-ext-install -j$(nproc) xsl
RUN docker-php-ext-install -j$(nproc) intl
RUN docker-php-ext-install -j$(nproc) soap
RUN docker-php-ext-install -j$(nproc) zip
RUN docker-php-ext-install -j$(nproc) xmlrpc
RUN docker-php-ext-install -j$(nproc) iconv
RUN docker-php-ext-install -j$(nproc) bcmath
RUN docker-php-ext-install -j$(nproc) mysqli
RUN docker-php-ext-install -j$(nproc) pdo_mysql
RUN docker-php-ext-install -j$(nproc) opcache
RUN docker-php-ext-install -j$(nproc) sockets


# Install pecl packages
#RUN pecl install -f \
#    amqp \
#    mcrypt \
#    xdebug
	

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer self-update 1.10.19 \
    && composer global require hirak/prestissimo --no-plugins --no-scripts