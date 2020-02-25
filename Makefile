# Для подробной информации перейдите по ссылке https://habr.com/ru/post/211751/

# Начало запроса к docker
docker = docker-compose -f ~/docker-npmc/docker/docker-compose.yml exec -u

# Пользователь
docker_user = user

# Root пользователь
docker_root = root

# Путь до докера
docker_dir_path = ~/docker-npmc/docker

# Зайти в bash php-fpm
php:
	${docker} ${docker_user} php-fpm bash -l

# Зайти в bash composer
composer:
	${docker} ${docker_user} composer bash -l

# Зайти в bash database
database:
	${docker} ${docker_root} database bash -l

# Зайти в bash nginx
nginx:
	${docker} ${docker_root} nginx bash -l

# Зайти в bash phpmyadmin
phpmyadmin:
	${docker} ${docker_root} phpmyadmin bash -l

# Сделать миграцию
migrate:
	${docker} ${docker_user} php-fpm sh -c "cd $(shell basename $(CURDIR)) && php yii migrate" -l

# Создать миграцию
migrate-create: 
	${docker} ${docker_user} php-fpm sh -c "cd $(shell basename $(CURDIR)) && php yii migrate/create ${a}" -l

# Установить зависимости
install: 
	${docker} ${docker_user} composer sh -c "cd $(shell basename $(CURDIR)) && composer install --ignore-platform-reqs" -l

# Создать новый конфиг для nginx
new:
	bash ${docker_dir_path}/nginx/sites/generate.sh ${a} && echo "127.0.0.1 ${a}.test" | sudo tee -a /etc/hosts

# Запустить Docker
	cd ${docker_dir_path} && docker-compose up
