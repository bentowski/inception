FROM debian:buster

RUN	apt update && apt upgrade -y \
	&& apt install mariadb-server mariadb-client -y \
	&& mkdir -p /var/run/mysqld \
	&& chown -R www-data:www-data /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

COPY ./tools/create_db.sh /bin/
COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./conf/ibdata1 /var/lib/mysql/ibdata1
COPY ./conf/wp_options.ibd /var/lib/mysql/db_name/wp_options.ibd
COPY ./conf/wp_users.ibd /var/lib/mysql/db_name/wp_users.ibd
COPY ./conf/wp_posts.ibd /var/lib/mysql/db_name/wp_posts.ibd
COPY ./conf/wp_usermeta.ibd /var/lib/mysql/db_name/wp_usermeta.ibd

RUN chmod 775 /etc/mysql/my.cnf
RUN chmod -R 775 /var/lib/mysql

CMD sh /bin/create_db.sh

EXPOSE 3306
