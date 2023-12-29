# !/bin/bash

sleep 10

# wp config create --allow-root --dbname=${MARIADB_DATABASE} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWORD} --dbhost=mariadb:3306 --path='/var/www/wordpress'
wp config set --allow-root DB_NAME ${MARIADB_DATABASE}
wp config set --allow-root DB_USER ${MARIADB_USER}
wp config set --allow-root DB_PASSWORD ${MARIADB_PASSWORD}
wp config set --allow-root DB_HOST mariadb:3306

# TODO: Handle this
wp core install --allow-root --url="localhost" --title="This a website" --admin_user="sup" --admin_password="hello123" --admin_email="araqioui@student.1337.ma"

mkdir /run/php

echo "SERVER IS RUNNING......"

/usr/sbin/php-fpm7.4 -F

# bash
