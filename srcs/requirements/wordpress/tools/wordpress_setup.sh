# !/bin/bash

sleep 10

wp config set --allow-root DB_NAME ${MARIADB_DATABASE}
wp config set --allow-root DB_USER ${MARIADB_USER}
wp config set --allow-root DB_PASSWORD ${MARIADB_PASSWORD}
wp config set --allow-root DB_HOST mariadb:3306

wp core install --allow-root --url="araqioui.42.fr" --title="My Wordpress Site" --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL}

wp user create --allow-root ${WP_USER} ${WP_EMAIL} --user_pass=${WP_PASS} --role=author

mkdir -p /run/php

echo "SERVER IS RUNNING......"

/usr/sbin/php-fpm7.4 -F
