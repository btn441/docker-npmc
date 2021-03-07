#!/bin/bash

CONTENT=$(cat <<EOF
version: '3.7'

services:
EOF
)

NGINX=$(cat <<EOF

  nginx:
    ports:
      - "80:80"
      - "443:443"
EOF
)

MARIADB=$(cat <<EOF

  mariadb:
    ports:
      - "3306:3306"
EOF
)

POSTGRES=$(cat <<EOF

  postgres:
    ports:
      - "5432:5432"
EOF
)

ADMINER=$(cat <<EOF

  adminer:
    ports:
      - "8080:8080"
EOF
)

MONGO=$(cat <<EOF

  mongo:
    ports:
      - 27017:27017
EOF
)

MONGO_EXPRESS=$(cat <<EOF

  mongo-express:
    ports:
      - 8081:8081
EOF
)

REDIS=$(cat <<EOF

  redis:
    ports:
      - 6379:6379
EOF
)

ELASTICSEARCH=$(cat <<EOF

  elasticsearch:
    ports:
      - 9200:9200
EOF
)

for var in "$@"
do
    if [ $var = 'nginx' ]
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

cat <<EOF > docker-compose.override.yml
$CONTENT
EOF

cat <<EOF > example.docker-compose.override.yml
$CONTENT
EOF
