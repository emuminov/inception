#!/bin/bash
cd /var/www/html/

#if [ ! -f wp-config.php ]; then
    rm -rf ./*
    wp core download --version="6.3.2" --allow-root
    wp config create --dbname=wordpress --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --allow-root
    wp core install --url=localhost --title=inception --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=admin@example.com  --allow-root
#fi
exec "$@"
