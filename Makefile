docker = docker-compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.override.yml 

# Запустить Docker демона
.PHONY: run
run:
	${docker} up -d

# Остановить работу Docker'а
.PHONY: stop
stop:
	${docker} stop

# Зайти в bash php-fpm
.PHONY: php
php:
	${docker} exec php-fpm bash -l

# Зайти в sh mariadb
.PHONY: mariadb
mariadb:
	${docker} exec mariadb sh -l

# Зайти в sh postgres
.PHONY: postgres
postgres:
	${docker} exec postgres sh -l

# Зайти в sh redis
.PHONY: redis
redis:
	${docker} exec redis sh -l

# Зайти в sh nginx
.PHONY: nginx
nginx:
	${docker} exec nginx sh -l

# Зайти в sh mongo
.PHONY: mongo
mongo:
	${docker} exec mongo sh -l

# Зайти в sh adminer
.PHONY: adminer
adminer:
	${docker} exec adminer sh -l

# Зайти в bash mongo-express
.PHONY: mongo-express
mongo-express:
	${docker} exec mongo-express bash -l

# Зайти в bash elasticsearch
.PHONY: elasticsearch
elasticsearch:
	${docker} exec elasticsearch bash -l
