<p align="center">
  <img src="https://raw.githubusercontent.com/btn441/docker-npmc/mariadb/banner.png" width="300"/>
</p>
<p align="center">
  <a href="https://rocketfirm.com"><img src="https://img.shields.io/badge/rocketfirm-site-red"/></a>
  <img src="https://img.shields.io/github/license/btn441/docker-npmc"/>
  <img src="https://img.shields.io/github/repo-size/btn441/docker-npmc"/>
  <img src="https://img.shields.io/badge/docker--compose-v3.7-blueviolet"/>
  <img src="https://img.shields.io/badge/php--fpm-v7.2--fpm-blueviolet"/>
  <img src="https://img.shields.io/badge/nginx-alpine-blueviolet"/>
  <img src="https://img.shields.io/badge/mariadb-alpine-blueviolet"/>
  <img src="https://img.shields.io/badge/adminer-alpine-blueviolet"/>
</p>

# docker-npmc (mariadb)
Ветка для твоего проекта с поддержкой mariadb.

# Images
Примерная информация веса всех images.
|Image|Tag|Size|
|:-:|:-:|:-:|
|[fromsi/php-fpm](https://hub.docker.com/r/fromsi/php-fpm)|latest|736MB|
|[yobasystems/alpine-mariadb](https://hub.docker.com/r/yobasystems/alpine-mariadb)|latest|216MB|
|[nginx](https://hub.docker.com/_/nginx)|alpine|37.9MB|
|[dehy/adminer](https://hub.docker.com/r/dehy/adminer)|latest|19.7MB|

# Установка
Для прошников: ```git clone https://github.com/btn441/docker-npmc.git -b mariadb && mv docker-npmc docker && rm -rf docker/.git && rm docker/banner.png && rm docker/.gitignore && rm docker/LICENSE && mv docker/Makefile Makefile```
1. Зайди в корень своего проекта (убедись, что нет директории ```docker```)
2. В корне проекта запусти команду ```git clone https://github.com/btn441/docker-npmc.git -b mariadb```
3. Так же в корне проекта ```mv docker-npmc docker && rm -rf docker/.git && rm docker/banner.png && rm docker/.gitignore && rm docker/LICENSE``` 
4. В ```/etc/hosts``` добавь домен в конце файла. Например: ```127.0.0.1 example.test```
5. В ```docker/nginx/default.conf``` измени ```server_name```
Дальше уже зависит от того, как ты будешь использовать данную конфигурацию (с установкой __ВСЁ__).

# Полезное
Эта информация тебе еще пригодится.
## DB
|Логин|Пароль|
|:-:|:-:|
|root|docker|

## Adminer
Ссылка ```localhost:8001```

## Composer
Он находится в контейнере ```php-fpm```

## UID | GID
Используется __1000__. Прописанно в Dockerfile.

## Makefile
Скопируй в ```docker``` файл ```Makefile```, в корень своего проекта.

|Команда|Описание|
|:-:|:-:|
|run|Запустить __docker-compose__|
|stop|Остановить __docker-compose__|
|php|Зайти в контейнер __php-fpm__|
|nginx|Зайти в контейнер __nginx__|
|adminer|Зайти в контейнер __adminer__|
|db|Зайти в контейнер __mariadb__|

