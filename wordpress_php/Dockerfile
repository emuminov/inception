FROM debian:12

# php-fpm for managing of the multiple processes
# php-mysqli for interacting with SQL database from php
# curl for fetching wordpress
RUN apt update && apt upgrade -y && apt install -y curl php-fpm php php-cgi php-mysql php-fpm php-pdo php-gd php-cli php-mbstring php-curl php-zip

# fetch wp-cli for handling wp
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
mv ./wp-cli.phar /usr/local/bin/wp && \
chmod +x /usr/local/bin/wp

# copy an edited fpm config file to replace the default one
COPY ./www.conf /etc/php/8.2/fpm/pool.d

# script for downloading wordpress files and starting fpm
COPY ./wordpress_start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress_start.sh
RUN touch /var/log/fpm-php.www.log

EXPOSE 9000

# running this service will create necessary stuff
# like the /var/run/php dir
RUN service php8.2-fpm start
ENTRYPOINT ["wordpress_start.sh"]

# -F flag means no daemonize, not running in the background
# -R means allow to run as root
CMD ["php-fpm8.2", "-F"]
