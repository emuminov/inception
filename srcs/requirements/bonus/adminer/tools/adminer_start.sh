#!/bin/bash
# moved at runtime instead of in the image because the file needs to be
# in the volume, which doesn't exist at the image creation step yet
if [ ! -f /var/www/html/adminer.php ]; then
    mv /adminer-4.8.1-en.php /var/www/html/adminer.php
fi
exec "$@"
