FROM php:7.3-fpm

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils \
\
# ZIP/Bzip/Archive
            libbz2-dev \
                zlib1g-dev \
                libzip-dev \
                zip unzip \
\
# IMAGES Imagick/Gd Dependencies
            libjpeg-dev \
		    libjpeg62-turbo-dev \
            libfreetype6-dev \
            libwebp-dev \
            libpng-dev \
            libmagickwand-dev \
            libmagickcore-dev \
\
#PostgreSQL DependencyLib
        libpq-dev \
\
# Another PHP Default Dependencies
        libmcrypt-dev \
        libxml++2.6-dev \
        libcurl3-dev \
        libxpm-dev \
\
#Custom Build Dependencies
         python git \
\
# ******** Configure
# Cconfigure GD
    && docker-php-ext-configure gd \
                 --with-gd \
                 --with-jpeg-dir \
                 --with-png-dir \
                 --with-zlib-dir \
	&& docker-php-ext-install gd \
\
#Configure Imagick
    && pecl install imagick \
    && docker-php-ext-enable imagick \
\
#Configure ZIP
    && docker-php-ext-configure zip --with-libzip \
	&& docker-php-ext-install zip \
\
#Configure Another Dependencies
	&& docker-php-ext-install \
	        curl \
	        mbstring \
	        xml\
	        sockets \
	        intl \
	        bcmath \
\
	        pdo \
	        mysqli \
	        pdo_mysql\
	        soap\
		exif\

\
# PCNTL Library Ifyou Need
#    && docker-php-ext-install pcntl \
\
        \
            &&  userdel -f www-data &&\
                if getent group www-data ; then groupdel www-data; fi &&\
                groupadd -g 1000 www-data &&\
                useradd -l -u 1000 -g www-data www-data &&\
                install -d -m 0755 -o www-data -g www-data /home/www-data &&\
                chown --changes --silent --no-dereference --recursive \
                      --from=33:33 1000:1000 \
                    /home/www-data \
        \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && rm -rf /tmp/* /var/cache/apk/* \
    && rm -r /var/lib/apt/lists/*

RUN su - www-data -c "composer global require hirak/prestissimo"

RUN apt-get update -y && \
    apt-get install -y openssh-client && \
    mkdir -p /home/www-data/.ssh && \
    chmod 777 /home/www-data/.ssh 

RUN curl -LO https://deployer.org/releases/v6.4.7/deployer.phar && \
    mv deployer.phar /usr/local/bin/dep && \
    chmod +x /usr/local/bin/dep

USER www-data

WORKDIR /var/www
