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

# Название контейнера phpmyadmin
docker_phpmyadmin = backends_phpmyadmin_1

# Название контейнера database
docker_database = backends_database_1

# Название контейнера nginx
docker_nginx = backends_nginx_1

# Название контейнера php-fpm
docker_php_fpm = backends_php-fpm_1

# Название контейнера composer
docker_composer = backends_composer_1

# Зайти в bash php-fpm
bash-php-fpm:
	${docker_path} ${docker_user} ${docker_php_fpm} bash -l

# Зайти в bash composer
bash-composer:
	${docker_path} ${docker_user} ${docker_composer} bash -l

# Зайти в bash database
bash-database:
	${docker_path} ${docker_root} ${docker_database} bash -l

# Зайти в bash nginx
bash-nginx:
	${docker_path} ${docker_root} ${docker_nginx} bash -l

# Зайти в bash phpmyadmin
bash-phpmyadmin:
	${docker_path} ${docker_root} ${docker_phpmyadmin} bash -l

# Сделать миграцию
php-migrate:
	${docker_path} ${docker_user} ${docker_php_fpm} sh -c "cd $(shell basename $(CURDIR)) && php yii migrate" -l

# Создать миграцию
php-migrate-create: 
	${docker_path} ${docker_user} ${docker_php_fpm} sh -c "cd $(shell basename $(CURDIR)) && php yii migrate/create ${var}" -l

# Установить зависимости
composer-install: 
	${docker_path} ${docker_user} ${docker_composer} sh -c "cd $(shell basename $(CURDIR)) && composer install --ignore-platform-reqs" -l
