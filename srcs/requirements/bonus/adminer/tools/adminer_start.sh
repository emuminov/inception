#!/bin/bash
mv /adminer-4.8.1-en.php /var/www/html/adminer.php

exec "$@"
