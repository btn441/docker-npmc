#!/bin/bash

CONTENT=$(cat <<EOF
version: '3.7'

services:
EOF
)

PHP_FPM=$(cat <<EOF

  php-fpm:
    #build:
      #context: php-fpm
      #dockerfile: Dockerfile
    image: rocketfirm911/php-fpm:7.4
    volumes:
      - ../:/var/www:delegated
      - ./php-fpm/php.ini:/usr/local/etc/php/conf.d/40-custom.ini:delegated
      - ~/.ssh:/home/www-data/.ssh:delegated
EOF
)

NGINX=$(cat <<EOF

  nginx:
    image: nginx:alpine
    volumes:
      - ../:/var/www:delegated
      - ./nginx/:/etc/nginx/conf.d:delegated
      - ./nginx/vhosts:/etc/nginx/vhosts:delegated
      - ./nginx/logs:/var/log/nginx:delegated
    depends_on:
      - php-fpm
EOF
)

MARIADB=$(cat <<EOF

  mariadb:
    image: yobasystems/alpine-mariadb
    command: --default-authentication-plugin=mysql_native_password
    environment:
      - MYSQL_ROOT_PASSWORD=docker
EOF
)

POSTGRES=$(cat <<EOF

  postgres:
    image: postgres:13
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
    volumes:
      - ./postgres/datadir:/var/lib/postgresql/data

EOF
)

ADMINER=$(cat <<EOF

  adminer:
    image: adminer
    environment:
      - ADMINER_DESIGN=hever
    volumes:
      - ./adminer/adminer.css:/var/www/html/designs/hever/adminer.css:delegated
EOF
)

MONGO=$(cat <<EOF

  mongo:
    image: mvertes/alpine-mongo
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: root
EOF
)

MONGO_EXPRESS=$(cat <<EOF

  mongo-express:
    image: mongo-express
    environment:
      ME_CONFIG_MONGODB_SERVER: mongo
      ME_CONFIG_BASICAUTH_USERNAME: root
      ME_CONFIG_BASICAUTH_PASSWORD: root
EOF
)

REDIS=$(cat <<EOF

  redis:
    image: redis:alpine
EOF
)

ELASTICSEARCH=$(cat <<EOF

  elasticsearch:
    image: elasticsearch:7.10.1
    environment:
      - discovery.type=single-node
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"
EOF
)

for var in "$@"
do
    if [ $var = 'php-fpm' ]
    then
    CONTENT+=$PHP_FPM
    elif [ $var = 'nginx' ]
    then
    CONTENT+=$NGINX
    elif [ $var = 'mariadb' ]
    then
    CONTENT+=$MARIADB
    elif [ $var = 'postgres' ]
    then
    CONTENT+=$POSTGRES
    elif [ $var = 'adminer' ]
    then
    CONTENT+=$ADMINER
    elif [ $var = 'mongo' ]
    then
    CONTENT+=$MONGO
    elif [ $var = 'mongo-express' ]
    then
    CONTENT+=$MONGO_EXPRESS
    elif [ $var = 'redis' ]
    then
    CONTENT+=$REDIS
    elif [ $var = 'elasticsearch' ]
    then
    CONTENT+=$ELASTICSEARCH
    fi
done

cat <<EOF > docker-compose.yml
$CONTENT
EOF
