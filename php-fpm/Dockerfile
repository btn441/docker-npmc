FROM php:7.1-fpm
RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev g++
RUN docker-php-ext-configure intl && docker-php-ext-install pdo_mysql intl zip 
CMD ["php-fpm"]
EXPOSE 9000