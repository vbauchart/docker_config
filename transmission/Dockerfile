FROM debian:bookworm-slim

RUN apt update && \
    apt install -y transmission-daemon perl && \
    apt clean

ADD clean_orphans.pl /usr/bin/

RUN groupadd -g 2000 torrent && \
    useradd -u "2000" -g 2000 torrent

USER torrent

CMD transmission-daemon -f -g /etc/transmission-daemon
