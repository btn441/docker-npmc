FROM php:7.2-fpm
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev g++
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && install-php-extensions imagick gd intl xsl zip pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD php.ini /usr/local/etc/php/conf.d/40-custom.ini

# Add user
RUN groupadd -g 1000 user
RUN useradd -u 1000 -ms /bin/bash -g user user

# Change user
USER user

CMD ["php-fpm"]
EXPOSE 9000
