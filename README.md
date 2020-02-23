# Добро пожаловать!
Репозиторий позволяет развернуть стек контейнеров в __Docker__. Будет создано пять контейнеров:
* [MariaDB](https://mariadb.org/) - ответвление от системы управления базами данных __MySQL__, разрабатываемое сообществом под лицензией GNU GPL;
* [PHPMyAdmin](https://www.phpmyadmin.net/) - веб-приложение с открытым кодом, написанное на языке __PHP__ и представляющее собой веб-интерфейс для администрирования СУБД __MySQL__
* [Composer](https://getcomposer.org/) - это пакетный менеджер уровня приложений для языка программирования __PHP__, который предоставляет средства по управлению зависимостями в __PHP-приложении__;
* [PHP-FPM](https://www.php.net/manual/ru/install.fpm.php) - является альтернативной реализацией __PHP FastCGI__ с несколькими дополнительными возможностями обычно используемыми для высоконагруженных сайтов;
* [NGINX](https://nginx.org/ru/) - веб-сервер и почтовый прокси-сервер, работающий на __Unix-подобных__ операционных системах.

## Репозиторий имеет
* Свой Makefile
* Готовая конфигурация (MariaDB, PHPMyAdmin, Composer, PHP-FPM и NGINX)
* Конфигурация для нескольких проектов
* Быстрый запуск контейнеров (из-за малого количества кода)
* Документация как с этим работать

## Установка (ОБЯЗАТЕЛЬНО)
1. Создай директорию для __Docker__ проектов (если еще не создал) ```mkdir ~/Dockers```
2. Зайдите в директорию и клонируйте репозиторий ```cd ~/Dockers && git clone https://github.com/btn441/docker-npmc.git```
3. Создайте директорию для хранения проектов ```mkdir ~/Backends```
4. Обязательно установить для своей системы __docker__ и __docker-compose__
5. Добавь своего пользователя в группу __docker__
6. Зайди и сбилди эту репу ```cd ~/Dockers/docker-npmc && docker-compose build```
7. Установи Makefile ```echo 'alias docker-make="make -f ~/Dockers/docker-npmc/Makefile"' >> ~/.bashrc && source ~/.bashrc```

## Как мы это всё используем? (с использованием Makefile)
1. ```cd ~/Backends && git clone example.git``` - скачиваем проект
2. ```docker-make new a=example``` - настраиваем файлы для __nginx__
3. ```cd ~/Dockers/docker-npmc && docker-compose up``` - запускаем новом терминале __Docker__
4. ```cd ~/Backends/example && docker-make install``` - устанавлеваем зависимости через __composer__
5. ```docker-make migrate``` - применяем миграции
6. Заходим в example.test (домен по дефолту .test)

## Docker
Полезные комманды, для __Docker__:
* ```docker-composer up``` - запустить __Docker__ (не в фоне);
* ```docker ps``` - посмореть активные контейнеры;
* ```docker-compose build``` - сбилдить;
* ```docker exec -tiu {user_name} {name_container} bash -l``` - зайти в контейнер (```{name_container}``` - название контейнера).

## Makefile (юзаем команды не входя в docker)
Внимание! Если вы идете против README.md, посмотрите код Makefile. Нужно будет настроить под себя.</br>
Вы можете использовать __Docker__ не выходя из корня проекта и прямо от туда использовать команды в терминале.</br>

Команды выполнять в корне проекта и пишите вначале ```docker-make ...```
| Команда | Аргументы | Описание |
|:-|:-|:-:|
| docker-make php | - | Зайти в bash php-fpm |
| docker-make composer | - | Зайти в bash composer |
| docker-make nginx | - | Зайти в bash nginx |
| docker-make phpmyadmin | - | Зайти в bash phpmyadmin |
| docker-make database | - | Зайти в bash database |
| docker-make migrate | - | Применить миграцию |
| docker-make migrate-create a=test | a (название миграции) | Создать миграцию |
| docker-make new a=test | a (название проекта) | Сгенерировать конфиг nginx и записать домен в /etc/hosts |
| docker-make install | - | Установить зависимости |

## Database
БД у нас будет использоваться __MariaDB__.</br>
Логи: __root__</br> 
Пароль: __docker__

## PHPMyAdmin
Чтобы делать изменения напрямую в __MariaDB__, у нас есть __PHPMyAdmin__.</br>
Ссылка http://localhost:8765

## Доступ к контейнеру (работа с юзерами)
Ниже таблица, частых кейсов по заходу в контейнер:
| Контейнер | Задача | Пользователь |
|:-:|:--:|:-:|
| composer | Обновить зависимости | user |
| php-fpm | Создание миграций | user |
| nginx | Зайти в контейнер | root 
| database | Зайти в контейнер | root |
| phpmyadmin | Зайти в контейнер | root |

### Изменить/Добавить пользователя
В __Dockerfile__ можно найти под командой ```RUN``` строку ```useradd```, ```groupadd``` или ```adduser```</br>
Там по стандарту __UID|GID__ 1000 (основной юзер системы __не root__). Можно найти информацию по __UID|GID__ по данной команде ```id``` и там можно копировать необходимую для вас информацию. Ниже таблица, что к чему. 
| Идентификатор | Описание |
|:-:|:-:|
| UID | ID юзера |
| GID | ID группы |

## Информация касается тех, кто не дружит с Makefile

### NGINX
Все новые домены для проектов записывать в ```/etc/hosts```! Пример ```127.0.0.1 examlpe.test```. </br>
Все наши домены должны оканчиваться на __.test__ (не обязательно, но рекомендуется).</br>
Добавляйте новый конфиг в __NGINX__ ```cd ~/Docker/docker-npmc/nginx/sites/```. В директории есть пример ```example.conf```.

### Composer
Зависимости можно обновлять через контейнер __composer__. </br>
Зайдите в контейнер ```docker exec -tiu root backends_composer_1 bash -l```, выберите проект ```ls && cd example``` и вводите команды связанные с __composer__.

### PHP-FPM
С проектом __PHP__ можно общаться через контейнер __php-fpm__. </br>
Зайдите в контейнер ```docker exec -tiu root backends_php-fpm_1 bash -l```, выберите проект ```ls && cd example``` и вводите команды связанные с __php-fpm__.

# Проблемы (просто следуйте рекомендациям ниже и всё будет хорошо)
1. Если вы устанавливаете пакеты через __composer__ используйте флаг ```--ignore-platform-reqs```;
