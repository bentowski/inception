FROM debian:buster

RUN	apt update \
	&& apt upgrade -y \
	&& apt install -y php7.3-fpm php-mysql mariadb-client tar wget curl\
	&& curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp



RUN useradd --create-home bentowski
WORKDIR /var/www/

# RUN	wget https://fr.wordpress.org/wordpress-6.2.2-fr_FR.tar.gz \
# 	&& tar -xzvf wordpress-6.2.2-fr_FR.tar.gz \
# 	&& rm -rf wordpress-6.2.2-fr_FR.tar.gz \
COPY wordpress/ ./
# RUN chown -R bentowski ./

COPY	tools/config.sh ./
COPY	conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY	conf/wp-config.php /var/www/wordpress/wp-config.php

# RUN chown bentowski ./config.sh

#WORKDIR ./wordpress

#RUN	wp core config --path='/var/www/wordpress' --dbhost=${DOMAIN_NAME} --dbname=${WP_DB_NAME} --dbuser=${WP_USER} --dbpass=${WP_USER_PASSWORD} --allow-root
#RUN	chmod 644 /var/www/wordpress/wp-config.php

RUN	ls  /etc/php/7.3/fpm/pool.d/

RUN	mkdir -p /run/php && mkdir /var/log/php7.3-fpm

# WORKDIR /home/bentowski
# USER bentowski

#RUN	wp core install --path='/var/www/wordpress' --url=bbaudry.42.fr --title="Inception" --admin_name=user42 --admin_password=user42 --admin_email=bbaudry@student.42.fr --allow-root

EXPOSE	9000

ENTRYPOINT sh config.sh
