FROM debian:bookworm-slim

RUN apt update && \
    apt install -y transmission-daemon perl && \
    apt clean

ADD clean_orphans.pl /usr/bin/

CMD transmission-daemon -f -g /etc/transmission-daemon
