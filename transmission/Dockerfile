FROM debian:buster

RUN apt update && \
    apt install -y transmission-daemon netcat && \
    apt clean

CMD transmission-daemon -f -g /etc/transmission-daemon
