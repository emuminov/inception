#!/bin/bash
if [ ! -f /var/www/html/wp-config.php ]; then
    cd /var/www/html/
    wp core download --allow-root
    wp config create --dbname=wordpress --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --allow-root
    wp core install --url=localhost --title=inception --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL  --allow-root
    wp user create "$WP_REGULAR_USER" "$WP_REGULAR_EMAIL" --user_pass="$WP_REGULAR_PASSWORD" --allow-root
fi
exec "$@"
