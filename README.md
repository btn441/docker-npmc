<p align="center">
  <img src="https://raw.githubusercontent.com/btn441/docker-npmc/mariadb/banner.png" width="300"/>
</p>
<p align="center">
  <a href="https://rocketfirm.com"><img src="https://img.shields.io/badge/rocketfirm-site-red"/></a>
  <img src="https://img.shields.io/github/license/btn441/docker-npmc"/>
  <img src="https://img.shields.io/github/repo-size/btn441/docker-npmc"/>
  <img src="https://img.shields.io/badge/docker--compose-v3.7-blueviolet"/>
  <img src="https://img.shields.io/badge/php--fpm-v7.2--fpm-blueviolet"/>
  <img src="https://img.shields.io/badge/nginx-v1.17.6-blueviolet"/>
  <img src="https://img.shields.io/badge/mariadb-v10.4.11-blueviolet"/>
  <img src="https://img.shields.io/badge/phpmyadmin-lates-blueviolet"/>
</p>

# docker-npmc (mysql)
Ветка для твоего проекта с поддержкой mysql.

# Конфигурация
Информация по конфигурации данной ветки.
|Название|Версия|Ссылка|
|:-:|:-:|:-:|
|docker-compose|3.7|[docker-compose.yml](https://github.com/btn441/docker-npmc/blob/mysql/docker-compose.yml)|
|php-fpm|7.2-fpm|[Dockerfile](https://github.com/btn441/docker-npmc/blob/mysql/php-fpm/Dockerfile)|
|nginx|1.17.6|[Dockerfile](https://github.com/btn441/docker-npmc/blob/mysql/nginx/Dockerfile)|
|mysql|5.7|[Dockerfile](https://github.com/btn441/docker-npmc/blob/mysql/db/Dockerfile)|
|phpmyadmin|lates|[image](https://hub.docker.com/r/phpmyadmin/phpmyadmin)|

# Установка
1. Зайди в корень своего проекта (убедись, что нет директории ```docker```)
2. В корне проекта запусти команду ```git clone https://github.com/btn441/docker-npmc.git -b mysql```
3. Так же в корне проекта ```mv docker-npmc docker && rm -rf docker/.git``` 
4. В ```/etc/hosts``` добавь домен в конце файла. Например: ```127.0.0.1 example.test```
5. В ```docker/nginx/sites/default.conf``` измени ```server_name```
Дальше уже зависит от того, как ты будешь использовать данную конфигурацию (с установкой __ВСЁ__).

# Полезное
Эта информация тебе еще пригодится.
## DB
|Логин|Пароль|
|:-:|:-:|
|root|docker|

## PHPMyAdmin
Ссылка ```localhost:8765```

## Composer
Он находится в контейнере ```php-fpm```

## UID | GID
Используется __1000__. Прописанно в Dockerfile.

## Makefile
Если у вы используете __yii2__. </br>
Скопируй в ```docker``` файл ```Makefile```, в корень своего проекта.

|Команда|Описание|
|:-:|:-:|
|install|Сделать первоначальную установку|
|run|Запустить __docker-compose__|
|stop|Остановить __docker-compose__|
|php|Зайти в контейнер __php-fpm__|
|nginx|Зайти в контейнер __nginx__|
|phpmyadmin|Зайти в контейнер __phpmyadmin__|
|db|Зайти в контейнер __mysql__|
