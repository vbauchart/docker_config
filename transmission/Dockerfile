FROM debian:bullseye

RUN apt update && \
    apt install -y transmission-daemon netcat && \
    apt clean

CMD transmission-daemon -f -g /etc/transmission-daemon
