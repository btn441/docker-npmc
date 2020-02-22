# Для подробной информации перейдите по ссылке https://habr.com/ru/post/211751/
#
# Скопируйте в корень проектов и пользуетесь не выходя из корня проекта.
#

# Начало запроса к docker
docker_path = docker exec -tiu

# Пользователь
docker_user = user

# Root пользователь
docker_root = root

# Родительская директория нашего Docker'а
docker_parent_dir = dockers

# Название контейнера phpmyadmin
docker_phpmyadmin = ${docker_parent_dir}_phpmyadmin_1

# Название контейнера database
docker_database = ${docker_parent_dir}_database_1

# Название контейнера nginx
docker_nginx = ${docker_parent_dir}_nginx_1

# Название контейнера php-fpm
docker_php_fpm = ${docker_parent_dir}_php-fpm_1

# Название контейнера composer
docker_composer = ${docker_parent_dir}_composer_1

# Зайти в bash php-fpm
php:
	${docker_path} ${docker_user} ${docker_php_fpm} bash -l

# Зайти в bash composer
composer:
	${docker_path} ${docker_user} ${docker_composer} bash -l

# Зайти в bash database
database:
	${docker_path} ${docker_root} ${docker_database} bash -l

# Зайти в bash nginx
nginx:
	${docker_path} ${docker_root} ${docker_nginx} bash -l

# Зайти в bash phpmyadmin
phpmyadmin:
	${docker_path} ${docker_root} ${docker_phpmyadmin} bash -l

# Сделать миграцию
migrate:
	${docker_path} ${docker_user} ${docker_php_fpm} sh -c "cd $(shell basename $(CURDIR)) && php yii migrate" -l

# Создать миграцию
migrate-create: 
	${docker_path} ${docker_user} ${docker_php_fpm} sh -c "cd $(shell basename $(CURDIR)) && php yii migrate/create ${var}" -l

# Установить зависимости
install: 
	${docker_path} ${docker_user} ${docker_composer} sh -c "cd $(shell basename $(CURDIR)) && composer install --ignore-platform-reqs" -l
