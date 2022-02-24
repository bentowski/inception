FROM debian:10

RUN	apt update \
	&& apt upgrade -y \
	&& apt install -y nginx openssl \
	&& mkdir -p /run/nginx

COPY	conf/nginx.conf /etc/nginx/conf.d/default.conf
RUN	chown -R www-data:www-data /var/www && chmod 755 /var/www

RUN	openssl req -x509 -nodes -days 1 -newkey rsa:2048 \
	-subj "/C=FR/ST=FRANCE/L=PARIS/O=INCEPTION/CN=bbaudry.42.fr"\
	-keyout /etc/ssl/private/nginx-cert.key -out /etc/ssl/certs/nginx-cert.crt

CMD nginx -g "daemon off;"

EXPOSE 443
