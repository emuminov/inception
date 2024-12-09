#!/bin/bash
mariadb-install-db
mariadb-upgrade
# change the values in the SQL script
sed -i "s/DUMMY_PASSWORD/${SQL_PASSWORD}/g" /etc/mysql/init.sql
sed -i "s/DUMMY_USER/${SQL_USER}/g" /etc/mysql/init.sql
useradd mariadb
chown -R mariadb /var/lib/mysql/
# could use mariadb-safe instead, but use just mariadb for better logs
exec "$@"
