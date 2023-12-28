# !/bin/bash

service mariadb start

# mysqld_safe &

# mysqld_safe --skip-grant-tables &

sleep 2

# Create a user
mysql -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@localhost IDENTIFIED BY '${MARIADB_PASSWORD}';"

# Give it permission on all databases
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_USER}'@localhost;"

# Creata a database
mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"

# Add a password to the root user
mysql -e "ALTER USER root@localhost IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"

# Reload privileges
mysql -u"${MARIADB_USER}"  -p"${MARIADB_PASSWORD}" -e "FLUSH PRIVILEGES;"

mysqladmin -u"${MARIADB_USER}" -p${MARIADB_PASSWORD} shutdown

# exec mysqld_safe
mysqld_safe
# bash
