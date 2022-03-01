FROM debian:buster

RUN	apt update && apt upgrade -y \
	&& apt install mariadb-server mariadb-client -y \
	&& mkdir -p /var/run/mysqld \
	&& chown -R www-data:www-data /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

COPY ./tools/create_db.sh ./
COPY ./conf/my.cnf /etc/mysql/my.cnf

CMD sh create_db.sh

EXPOSE 3306
