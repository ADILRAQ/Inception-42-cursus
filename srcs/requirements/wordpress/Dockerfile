FROM    debian:bullseye

RUN		apt update -y && apt upgrade -y

RUN		apt install wget php7.4 mariadb-client php-fpm php-mysql -y

RUN		wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN		cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN		chown -R root:root /var/www/wordpress

COPY	conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

