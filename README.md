<p align="center">
  <img src="https://raw.githubusercontent.com/btn441/docker-npmc/mariadb/banner.png" width="300"/>
</p>
<p align="center">
  <a href="https://rocketfirm.com"><img src="https://img.shields.io/badge/rocketfirm-site-red"/></a>
  <img src="https://img.shields.io/github/license/btn441/docker-npmc"/>
  <img src="https://img.shields.io/github/repo-size/btn441/docker-npmc"/>
  <img src="https://img.shields.io/badge/docker--compose-v3.7-blueviolet"/>
  <img src="https://img.shields.io/badge/php--fpm-v7.4--fpm-blueviolet"/>
  <img src="https://img.shields.io/badge/elasticsearch-7.10.1-blueviolet"/>
  <img src="https://img.shields.io/badge/nginx-alpine-blueviolet"/>
  <img src="https://img.shields.io/badge/mariadb-alpine-blueviolet"/>
  <img src="https://img.shields.io/badge/postgres-latest-blueviolet"/>
  <img src="https://img.shields.io/badge/adminer-latest-blueviolet"/>
  <img src="https://img.shields.io/badge/mongo-latest-blueviolet"/>
  <img src="https://img.shields.io/badge/mongo--express-latest-blueviolet"/>
</p>

# docker-npmc
Чтобы установить докер сборку, достаточно зайти в проект и ввести ```git clone https://github.com/btn441/docker-npmc.git -b master && mv docker-npmc docker && cd docker && bash install.sh nginx php-fpm postgres adminer && cd ..``` </br>
По всем вопросам можешь писать в [issues](https://github.com/btn441/docker-npmc/issues) или [телегу](https://t.me/FromSi).

# Images
Примерная информация веса всех images.
|Image|Tag|Size|
|:-:|:-:|:-:|
|[elasticsearch](https://hub.docker.com/_/elasticsearch)|7.10.1|774MB|
|[fromsi/php-fpm](https://hub.docker.com/r/fromsi/php-fpm)|latest|719MB|
|[kartoza/postgis](https://hub.docker.com/r/kartoza/postgis/)|latest|491MB|
|[yobasystems/alpine-mariadb](https://hub.docker.com/r/yobasystems/alpine-mariadb)|latest|216MB|
|[nginx](https://hub.docker.com/_/nginx)|alpine|21.6MB|
|[dehy/adminer](https://hub.docker.com/r/dehy/adminer)|latest|90.5MB|
|[mvertes/alpine-mongo](https://hub.docker.com/r/mvertes/alpine-mongo)|latest|123MB|
|[mongo-express](https://hub.docker.com/_/mongo-express)|latest|130MB|
|[redis](https://hub.docker.com/_/redis)|alpine|32.2MB|

# Установка (для опытных)
1. Зайди в корень проекта и запусти ```git clone https://github.com/btn441/docker-npmc.git -b master && mv docker-npmc docker```
2. Ознакомься с образами ниже (нужно)
3. Зайди в директорию __docker__
4. Запусти установощник с выбранными образами. Пример: ```bash install.sh nginx php-fpm mariadb adminer```
5. Запиши в .gitignore то, что нужно скрыть. Предлагаю записать __docker__ и __Makefile__
6. Настрой конфиги проекта под докер и запустить в корне проекта ```make run```

Если хочешь удалить сборку, пропиши в корне проекта ```rm Makefile && rm -rf docker```.

## Образы
|Образ|Флаг для подключения|Пример|
|:-:|:-:|:-:|
|php-fpm|pfp-fpm|```bash install.sh pfp-fpm```|
|mariadb|mariadb|```bash install.sh mariadb```|
|postgres|postgres|```bash install.sh postgres```|
|nginx|nginx|```bash install.sh nginx```|
|adminer|adminer|```bash install.sh adminer```|
|redis|redis|```bash install.sh redis```|
|mongo|mongo|```bash install.sh mongo```|
|mongo-express|mongo-express|```bash install.sh mongo-express```|
|elasticsearch|elasticsearch|```bash install.sh elasticsearch```|

# Полезное
Эта информация тебе еще пригодится.

## DB
|Type|Host|Логин|Пароль|
|:-:|:-:|:-:|:-:|
|MySQL|mariadb|root|docker|
|PostgreSQL|postgres|postgres|docker|

## make php
В контейнере ```php-fpm``` можно делать миграции, использовать __composer__ и __[deployer](https://deployer.org/)__.

## UID | GID
Используется __1000__ (проверяй свой __uid__ через команду `id` и подставляй свой в __php-fpm__ Dockerfile).

## Ports
Порты находятся в файле __docker-compose.override.yml__.
|Контейнер|Порт|
|:-:|:-:|
|php-fpm|---|
|nginx|80 и 443|
|mariadb|3306|
|postgres|5432|
|adminer|8080|
|mongo|27017|
|mongo-express|8081|
|redis|6379|
|elasticsearch|9200|

## Makefile
|Команда|Описание|
|:-:|:-:|
|run|Запустить __docker-compose__|
|stop|Остановить __docker-compose__|
|php|Зайти в контейнер __php-fpm__|
|nginx|Зайти в контейнер __nginx__|
|adminer|Зайти в контейнер __adminer__|
|mariadb|Зайти в контейнер __mariadb__|
|postgres|Зайти в контейнер __postgres__|
|mongo|Зайти в контейнер __mongo__|
|mongo-express|Зайти в контейнер __mongo-express__|
|redis|Зайти в контейнер __redis__|
|elasticsearch|Зайти в контейнер __elasticsearch__|
