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

# Зайти в bash database
.PHONY: db
db:
	${docker} exec db bash -l

# Зайти в bash nginx
.PHONY: nginx
nginx:
	${docker} exec nginx bash -l

# Зайти в bash phpmyadmin
.PHONY: phpmyadmin
phpmyadmin:
	${docker} exec phpmyadmin bash -l
