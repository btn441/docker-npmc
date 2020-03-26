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

# Добро пожаловать!
Данная конфигурация поможет тебе с поддержкой нескольких проектов на __PHP__. И заставит забыть про геморой с установкой всех тех настроек, которые мы сейчас тебе тут опишем.

## Ветки как что-то другое
Каждая ветка имеет свои плюшки!
|Ветка|Описание|
|:-:|:-:|
|[master](https://github.com/btn441/docker-npmc/tree/master)|Для нескольких проектов. С поддержкой __MariaDB__. (не рекомендуем)|
|[mysql](https://github.com/btn441/docker-npmc/tree/mysql)|Для одного проекта. С поддержкой __MySQL__|
|[mariadb](https://github.com/btn441/docker-npmc/tree/mariadb)|Для одного проекта. С поддержкой __MariaDB__|

# Информация
Будет создано четыре контейнера:
* [MariaDB](https://mariadb.org/) - ответвление от системы управления базами данных __MySQL__, разрабатываемое сообществом под лицензией GNU GPL;
* [PHPMyAdmin](https://www.phpmyadmin.net/) - веб-приложение с открытым кодом, написанное на языке __PHP__ и представляющее собой веб-интерфейс для администрирования СУБД __MySQL__
* [PHP-FPM](https://www.php.net/manual/ru/install.fpm.php) - является альтернативной реализацией __PHP FastCGI__ с несколькими дополнительными возможностями обычно используемыми для высоконагруженных сайтов;
* [NGINX](https://nginx.org/ru/) - веб-сервер и почтовый прокси-сервер, работающий на __Unix-подобных__ операционных системах.

## Установка
Скачай из [релизов](https://github.com/btn441/docker-npmc/releases) необходимую тебе версию. Файл является bash скриптом. Он загружает этот репозиторий более компактно.
| Путь | Описание |
|:-|:-|
| ~/Docker/docker-npmc | Сам репозиторий Docker |
| ~/WebProjects | Хранение проектов |
| /bin/docker-npmc | Исполняемый файл make-file |
| /etc/hosts | Для своих доменов (системное решение) |

## Docker
Полезные комманды, для __Docker__:
* ```docker-composer up``` - запустить __Docker__ (не в демоне);
* ```docker ps``` - посмореть активные контейнеры;
* ```docker-compose build``` - сбилдить;

## Makefile (юзаем команды не входя в docker)
Внимание! Если ты идешь против README.md, посмотри код Makefile. Нужно будет настроить этот файл под себя.</br>
Ты можешь использовать __Docker__ не выходя из корня проекта и прямо от туда использовать команды.</br>

Команды выполняй в корне проекта и пиши вначале ```docker-npmc ...```
| Команда | Описание |
|:-|:-:|
| docker-npmc php | Зайти в bash php-fpm |
| docker-npmc composer | Зайти в bash composer |
| docker-npmc nginx | Зайти в bash nginx |
| docker-npmc phpmyadmin | Зайти в bash phpmyadmin |
| docker-npmc database | Зайти в bash database |
| docker-npmc migrate | Применить миграцию (нужно быть в корне проекта) |
| docker-npmc install | Установить зависимости (нужно быть в корне проекта) |

## Database
У тебя __MariaDB__.</br>
Логи: __root__</br> 
Пароль: __docker__

## PHPMyAdmin
Чтобы делать изменения напрямую в __MariaDB__, у тебя есть __PHPMyAdmin__.</br>
Ссылка http://localhost:8765

## Доступ к контейнеру
| Контейнер | Пользователь |
|:-:|:--:|
| php-fpm | user |
| nginx | root |
| database | root |
| phpmyadmin | root |

### Изменить/Добавить пользователя
В __Dockerfile__ можно найти под командой ```RUN``` строку ```useradd```, ```groupadd``` или ```adduser```</br>
Там по стандарту __UID|GID__ 1000 (основной юзер системы __не root__). Можно найти информацию по __UID|GID__ по данной команде ```id``` и там можно копировать необходимую для тебя информацию. Ниже таблица, что к чему. 
| Идентификатор | Описание |
|:-:|:-:|
| UID | ID юзера |
| GID | ID группы |

## Общая информация

### NGINX
Все новые домены для проектов записывай в ```/etc/hosts```! Пример ```127.0.0.1 examlpe.test```. </br>
Все домены должны оканчиваться на __.test__ (не обязательно, но рекомендуется).</br>
Добавляй новый конфиг в __NGINX__ ```cd ~/Docker/docker-npmc/nginx/sites/```. В директории есть пример ```example.conf```.</br>
Есть удобный генератор конфигов, при работе с новым проектом. (есть в Makefile)</br>
```${docker_dir_path}/nginx/sites/generate.sh ${example} && echo "127.0.0.1 ${example}.test" | sudo tee -a /etc/hosts```

### PHP-FPM
С проектом __PHP__ можно общаться через контейнер __php-fpm__. </br>
Зайди в контейнер ```docker-compose exec -u user php-fpm bash -l```, Выбери проект ```ls && cd example``` и вводи команды связанные с __php-fpm__.
