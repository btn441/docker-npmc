<p align="center">
  <img src="https://raw.githubusercontent.com/btn441/docker-npmc/mariadb/banner.png" width="300"/>
</p>
<p align="center">
  <a href="https://rocketfirm.com"><img src="https://img.shields.io/badge/rocketfirm-site-red"/></a>
  <img src="https://img.shields.io/github/license/btn441/docker-npmc"/>
  <img src="https://img.shields.io/github/repo-size/btn441/docker-npmc"/>
  <img src="https://img.shields.io/badge/docker--compose-v3.7-blueviolet"/>
  <img src="https://img.shields.io/badge/mariadb-alpine-blueviolet"/>
  <img src="https://img.shields.io/badge/mongo-alpine-blueviolet"/>
  <img src="https://img.shields.io/badge/redis-alpine-blueviolet"/>
  <img src="https://img.shields.io/badge/adminer-alpine-blueviolet"/>
  <img src="https://img.shields.io/badge/mongo--express-latest-blueviolet"/>
</p>

# docker-npmc (all-db)
Ветка для кастомизирования БД.

# Images
Примерная информация веса всех images.
|Image|Tag|Size|
|:-:|:-:|:-:|
|[yobasystems/alpine-mariadb](https://hub.docker.com/r/yobasystems/alpine-mariadb)|latest|216MB|
|[dehy/adminer](https://hub.docker.com/r/dehy/adminer)|latest|19.7MB|
|[redis](https://hub.docker.com/_/redis)|rc-alpine|31.5MB|
|[mongo-express](https://hub.docker.com/_/mongo-express)|latest|127MB|
|[mvertes/alpine-mongo](https://hub.docker.com/r/mvertes/alpine-mongo)|latest|123MB|

# Установка
Склонируй и используй ```git clone https://github.com/btn441/docker-npmc.git -b all-db```

# Полезное
Эта информация тебе еще пригодится.
## DB
|Логин|Пароль|
|:-:|:-:|
|root|root|

## Adminer
Ссылка ```localhost:8001```

## MongoExpress
Ссылка ```localhost:8002```

## Ports
|Name|Port|
|:-:|:-:|
|adminer|8001|
|mongo-express|8002|
|redis|6379|
|mongo|27017|
|mariadb|3306|
