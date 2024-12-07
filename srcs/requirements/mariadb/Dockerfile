FROM debian:bullseye 

# mariadb-server is the database engine
# mariadb-client is the text interface fro interacting with it
RUN apt update -y && apt upgrade -y && apt install -y mariadb-server mariadb-client

# MariaDB conf and init file for when the database starts
# the fact that it's init was specified in the 50-server.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/init.sql /etc/mysql/init.sql

# creates necessary stuff for MariaDB to run (like dir /run/mysqld/)
RUN service mariadb start

# script that changes the values in the init script by the ones provided with the .env file
# it also launches MariaDB
COPY ./tools/mariadb_start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb_start.sh

EXPOSE 3306
ENTRYPOINT ["mariadb_start.sh"]
CMD ["mariadbd"]
