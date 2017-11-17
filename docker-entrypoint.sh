#!/usr/bin/env sh

cp -r /app/* /dev/shm

exec php -S 0.0.0.0:80 /dev/shm/web/app.php
