#!/bin/bash
mariadb-install-db
mariadb-upgrade
sed -i "s/DUMMY_PASSWORD/${SQL_PASSWORD}/" /etc/mysql/init.sql
sed -i "s/DUMMY_USER/${SQL_USER}/" /etc/mysql/init.sql
# could use mariadb-safe instead, but use just mariadb for better logs
exec "$@"
