FROM debian:bullseye 

# php-fpm for managing of the multiple processes
# php-mysqli for interacting with SQL database from php
# php-redis for interacting with redis (bonus)
# wget for fetching wordpress
RUN apt update -y && apt upgrade -y && apt install -y wget php-fpm php php-mysql php-redis

# fetch wp-cli for handling wp
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
mv ./wp-cli.phar /usr/local/bin/wp && \
chmod +x /usr/local/bin/wp

# copy the fpm config file to replace the default one
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

# script for initializing wordpress and starting fpm
COPY ./tools/wordpress_start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress_start.sh

EXPOSE 9000

# running this service will create necessary stuff
# like the /var/run/php dir
RUN service php7.4-fpm start
ENTRYPOINT ["wordpress_start.sh"]

# -F flag means no daemonize, not running in the background
CMD ["php-fpm7.4", "-F"]
