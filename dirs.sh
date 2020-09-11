for var in "$@"
do
    if [ $var = 'php-fpm' ]
    then
    cp -rf dirs/php-fpm php-fpm
    elif [ $var = 'nginx' ]
    then
    cp -rf dirs/nginx nginx
    elif [ $var = 'adminer' ]
    then
    cp -rf dirs/adminer adminer
    fi
done