FROM debian:buster

RUN	apt update \
	&& apt upgrade -y \
	&& apt install -y nginx openssl certbot python3-certbot-nginx \
	&& mkdir -p /run/nginx \
	&& mkdir /etc/nginx/ssl

RUN	chown -R www-data:www-data /var/www/ && chmod 755 /var/www/
	#&& sudo certbot --nginx-d www.bbaudry.42.fr

COPY	conf/nginx.conf /etc/nginx/conf.d/default.conf

#WORKDIR /etc/nginx/ssl/

RUN	openssl req -x509 -nodes -days 1 -newkey rsa:2048 \
	-subj "/C=FR/ST=Ile-de-France/L=PARIS/O=inception/CN=bbaudry.42.fr" \
	-keyout /etc/ssl/private/nginx-cert.key \
	-out /etc/ssl/certs/nginx-cert.crt
#	-keyout /etc/ssl/private/nginx-cert.key /
#	-out /etc/ssl/certs/nginx-cert.crt

CMD service nginx restart


CMD nginx -g "daemon off;"

EXPOSE 443
