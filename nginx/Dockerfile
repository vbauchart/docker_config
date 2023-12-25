FROM debian:bookworm-slim

RUN apt update && apt install -y nginx libnginx-mod-http-fancyindex git

RUN git clone https://github.com/Naereen/Nginx-Fancyindex-Theme.git fancy-theme && \
    mv fancy-theme/Nginx-Fancyindex-Theme-dark /var/www/theme

ADD default /etc/nginx/sites-enabled/

RUN sed -i '/user .*;/d' /etc/nginx/nginx.conf \
    && sed -i 's,/run/nginx.pid,/tmp/nginx.pid,' /etc/nginx/nginx.conf \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log 

RUN groupadd -g 2000 nginx && \
    useradd -u "2000" -g 2000 nginx

USER nginx

CMD nginx -g 'daemon off;'
