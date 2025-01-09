#!/bin/sh
/usr/local/sbin/php-fpm &
echo "PHP-FPM and Caddy is started"
/usr/bin/caddy run --config /etc/caddy/Caddyfile
