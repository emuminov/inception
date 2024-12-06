#!/bin/bash
if [ ! -f /var/www/html/wp-config.php ]; then
    cd /var/www/html/
    wp core download --force --allow-root
    wp config create --dbname=wordpress --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --allow-root
    wp core install --url=$DOMAIN_NAME --title=inception --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL  --allow-root
    wp user create "$WP_REGULAR_USER" "$WP_REGULAR_EMAIL" --user_pass="$WP_REGULAR_PASSWORD" --allow-root

    # definitions for the redis
    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --allow-root # default port of redis
    wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
    wp config set WP_REDIS_CLIENT phpredis --allow-root
    wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root
    wp redis enable --allow-root
    # to check if redis is working go to /wp-admin -> plugins
fi
exec "$@"
