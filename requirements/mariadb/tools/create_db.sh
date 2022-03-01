#!/bin/bash

echo "Database initialization"

mysqld &

if ! mysqladmin --wait=30 ping;
then
	printf "Could not ping mariadb for 30 seconds, runtime configuration is not possible.\n"
	exit 1
fi

echo "Building database"

mysql -e "CREATE DATABASE IF NOT EXISTS db_name;"
mysql -e "CREATE USER IF NOT EXISTS 'user42'@'%' IDENTIFIED BY 'user42';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root42'@'%' IDENTIFIED BY 'root42';"
mysql -e "GRANT ALL PRIVILEGES ON db_name.* TO 'user42'@'%';"
mysql -e "INSERT INTO db_name.wp_users (user_login,user_pass,user_nicename,user_email,user_url,user_registered,user_activation_key,user_status,display_name) VALUES ('user42',MD5('user42'),'user42','user42@42.fr','https://bbaudry.42.fr','2021-10-27','',0,'user42');"
mysql -e "FLUSH PRIVILEGES;"

echo "Database shutdown"
mysqladmin shutdown

echo "Restarting database"
exec mysqld -u root
