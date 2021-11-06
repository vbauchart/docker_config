FROM debian:stable-slim

RUN apt update && \
    apt install -y vsftpd && \
    apt clean

COPY vsftpd.conf /etc/vsftpd.conf
COPY run.sh /

RUN mkdir -p /var/run/vsftpd/empty

ENV FILMS_PASSWORD ""

RUN useradd films 

CMD /run.sh
