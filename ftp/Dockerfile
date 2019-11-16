FROM debian:buster

RUN apt update && \
    apt install -y vsftpd && \
    apt clean

COPY vsftpd.conf /etc/vsftpd.conf

RUN mkdir -p /var/run/vsftpd/empty

ENV FILM_PASSWORD

RUN useradd films && \
    echo "films:${FILM_PASSWORD}" |chpasswd

CMD vsftpd
