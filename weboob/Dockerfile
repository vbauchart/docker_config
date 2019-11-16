FROM debian:buster

RUN apt update && \
    apt install -y python3-pip expect vim git gnupg pass jq && \
#    apt install -y git python expect vim \
#                   python-setuptools python-lxml python-yaml \
#                   python-pip \
#                   python-pil python-pdfminer python-prettytable python-html2text \
    apt-get clean

#RUN git clone https://git.weboob.org/weboob/weboob.git && \
#    cd weboob && \
#    python setup.py install

RUN pip3 install git+https://git.weboob.org/weboob/weboob.git

ENV LANG=C.UTF-8

ADD secret.asc /
RUN gpg --batch --import /secret.asc
ADD gpg.conf /root/.gnupg/

ADD mainloop.sh mainloop.exp reformat_json.sh weboob-config.exp /

RUN expect -f weboob-config.exp

CMD /mainloop.sh
