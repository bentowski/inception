#!/bin/bash

sleep 10
# wp core install --path='/var/www/wordpress' --url=localhost --title="Inception" --admin_name=root42 --admin_password=root42 --admin_email=bbaudry@student.42.fr --allow-root
# wp user create --path='/var/www/wordpress' user42 user42@user.42.fr --user_pass=user42 --role=editor --allow-root
/usr/sbin/php-fpm7.3 -F
