FROM debian:stable-slim

RUN apt update && apt install -y nginx libnginx-mod-http-fancyindex git

RUN git clone https://github.com/Naereen/Nginx-Fancyindex-Theme.git fancy-theme && \
    mv fancy-theme/Nginx-Fancyindex-Theme-dark /var/www/theme

ADD default /etc/nginx/sites-enabled/

EXPOSE 80

CMD nginx -g 'daemon off;'
