FROM debian:bullseye 

# same dependencies as for wordpress container
RUN apt update && apt upgrade -y && apt install -y wget php-fpm php php-mysql

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

RUN service php7.4-fpm start

COPY ./tools/adminer_start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/adminer_start.sh

EXPOSE 9000

ENTRYPOINT ["adminer_start.sh"]

# connect to the <container_name>:<internal_posrt> (mariadb:3306)
# use SQL user and SQL password, NOT wp user and wp password
CMD ["php-fpm7.4", "-F"]
