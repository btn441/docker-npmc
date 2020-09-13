docker = docker-compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.override.yml 

# Запустить Docker демона
.PHONY: run
run:
	${docker} up -d
	${docker} exec php-fpm sh -c "composer install"

# Остановить работу Docker'а
.PHONY: stop
stop:
	${docker} stop

# Зайти в bash php-fpm
.PHONY: php
php:
	${docker} exec php-fpm bash -l

# Зайти в bash mariadb
.PHONY: mariadb
mariadb:
	${docker} exec mariadb bash -l

# Зайти в bash redis
.PHONY: redis
redis:
	${docker} exec redis sh -l

# Зайти в bash nginx
.PHONY: nginx
nginx:
	${docker} exec nginx sh -l

# Зайти в bash mongo
.PHONY: mongo
mongo:
	${docker} exec mongo sh -l

# Зайти в bash adminer
.PHONY: adminer
adminer:
	${docker} exec adminer sh -l

# Зайти в bash mongo-express
.PHONY: mongo-express
mongo-express:
	${docker} exec mongo-express bash -l
