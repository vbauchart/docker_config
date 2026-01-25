FROM debian:trixie-slim

RUN apt update && apt install -y openssh-server curl net-tools

RUN groupadd -g 2000 tunnel && \
    useradd -m -u "2000" -g 2000 tunnel

COPY sshd_config /etc/ssh/
COPY host_keys/ssh_host_ed25519_key* /etc/ssh/
RUN chown -Rv tunnel:tunnel /etc/ssh/

RUN mkdir /home/tunnel/.ssh
ADD authorized_keys /home/tunnel/.ssh/
RUN chown -Rv tunnel:tunnel /home/tunnel/.ssh && \
    chmod 700 /home/tunnel/.ssh && \
    chmod 600 /home/tunnel/.ssh/authorized_keys

USER tunnel
CMD ["/usr/sbin/sshd", "-D", "-e"]
