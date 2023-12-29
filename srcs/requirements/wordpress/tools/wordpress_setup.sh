# !/bin/bash

# sleep 10

# wp config create --allow-root --dbname=${MARIADB_DATABASE} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_PASSWORD} --dbhost=mariadb:3306 --path='/var/www/wordpress'
wp config set --allow-root DB_NAME ${MARIADB_DATABASE}
wp config set --allow-root DB_USER ${MARIADB_USER}
wp config set --allow-root DB_PASSWORD ${MARIADB_PASSWORD}
wp config set --allow-root DB_HOST mariadb:/run/mysqld/mysqld.sock

# /usr/sbin/php-fpm7.4 -F

bash
