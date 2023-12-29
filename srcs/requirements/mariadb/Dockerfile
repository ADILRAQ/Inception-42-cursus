FROM	debian:bullseye

RUN		apt update -y
RUN		apt upgrade -y
RUN		apt install mariadb-server -y

COPY    conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY    tools/mariadb_setup.sh /
# RUN     chmod +x mariadb_setup.sh

# ENV     MARIADB_USER=adil
# ENV     MARIADB_PASSWORD=hello
# ENV     MARIADB_DATABASE=wp
# ENV     MARIADB_ROOT_PASSWORD=wp1

ENTRYPOINT [ "/bin/bash", "mariadb_setup.sh" ]