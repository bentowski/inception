FROM debian:10

RUN	apt update \
	&& apt upgrade -y \
	&& apt install -y php7.3-fpm php-mysql mariadb-client tar wget

WORKDIR /var/www

RUN	wget https://wordpress.org/latest.tar.gz \
	&& tar -xzvf latest.tar.gz \
	&& rm -rf latest.tar.gz

#COPY	tools/wp_install.sh wp_install.sh

#CMD	bash wp_install.sh

#COPY	conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN	mkdir -p /run/php && mkdir /var/log/php-fpm

EXPOSE	9000

ENTRYPOINT /usr/sbin/php-fpm7.3 -F
