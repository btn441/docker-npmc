FROM php:7.1-fpm
ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/
RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev g++
RUN docker-php-ext-configure intl && docker-php-ext-install pdo_mysql intl zip 
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && install-php-extensions imagick

# Add user
RUN groupadd -g 1000 user
RUN useradd -u 1000 -ms /bin/bash -g user user

# Change user
USER user

CMD ["php-fpm"]
EXPOSE 9000
