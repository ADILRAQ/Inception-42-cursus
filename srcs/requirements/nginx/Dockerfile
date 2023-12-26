FROM	debian:bullseye

RUN		apt update -y
RUN		apt upgrade -y
RUN		apt install nginx -y
RUN		apt install openssl -y
RUN		apt install nano -y
RUN		apt clean

RUN		mkdir -p /etc/nginx/ssl

RUN		openssl req -x509 -nodes \
		-out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key \
		-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=araqioui.42.fr/UID=araqioui"

# Folder that allows us to store the NGINX config files
# RUN		mkdir -p /var/run/nginx

COPY	conf/nginx.conf /etc/nginx/nginx.conf

RUN		chmod 775 /var/www/html
RUN		chown -R www-data:www-data /var/www/html

CMD		["nginx", "-g", "daemon off;"]