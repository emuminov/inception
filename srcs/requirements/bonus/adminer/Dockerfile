FROM debian:bullseye 

# same dependencies as for wordpress container
RUN apt update && apt upgrade -y && apt install -y wget php-fpm php php-mysql

# fetch the adminer file
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

RUN service php7.4-fpm start

COPY ./tools/adminer_start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/adminer_start.sh

EXPOSE 9000

ENTRYPOINT ["adminer_start.sh"]

# connect to the <container_name>:<internal_posrt> (mariadb:3306)
# use SQL user and SQL password, NOT wp user and wp password
CMD ["php-fpm7.4", "-F"]
