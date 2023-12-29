# !/bin/bash

service mariadb start

sleep 2

# Create a user
mysql -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"

# Give it permission on all databases
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_USER}'@'%';"

# Creata a database
mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"

# Add a password to the root user
mysql -e "ALTER USER root@localhost IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"

# Reload privileges
# mysql -u"${MARIADB_USER}"  -p"${MARIADB_PASSWORD}" -e "FLUSH PRIVILEGES;"
mysql -u root  -p"${MARIADB_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# mysqladmin -u"${MARIADB_USER}" -p"${MARIADB_PASSWORD}" shutdown
mysqladmin -u root -p"${MARIADB_ROOT_PASSWORD}" shutdown

mysqld_safe
