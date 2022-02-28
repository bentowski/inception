FROM debian:10

RUN	apt update \
	&& apt upgrade -y \
	&& apt install -y nginx openssl \
	&& mkdir -p /run/nginx
	#&& apt install curl gnupg2 ca-certificates lsb-release debian-archive-keyring \
	#&& curl https://nginx.org/keys/nginx_signing.key \
	#| gpg --dearmor \
	#| sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg > /dev/null \
	#&& gpg --dry-run --quiet

COPY	conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY	conf/nginx.conf /etc/nginx/site-avalaible/default
#COPY	conf/nginx.conf /etc/nginx/site-enable/bbaudry.42.fr
RUN	chown -R www-data:www-data /var/www/ && chmod 755 /var/www/

CMD nginx restart

#RUN	openssl req -x509 -nodes -days 1 -newkey rsa:2048 \
#	-subj "/C=FR/ST=FRANCE/L=PARIS/O=INCEPTION/CN=bbaudry.42.fr"\
#	-keyout /etc/ssl/private/nginx-cert.key -out /etc/ssl/certs/nginx-cert.crt

CMD nginx -g "daemon off;"

EXPOSE 80
