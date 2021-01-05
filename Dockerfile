FROM ubuntu:16.04

WORKDIR /root

# RUN wget http://ftp.lysator.liu.se/pub/opensuse/repositories/home:/colomboem/xUbuntu_16.04/amd64/dukto_6.0-1_amd64.deb
COPY ./dukto_6.0-1_amd64.deb /root/dukto_6.0-1_amd64.deb

RUN sed -i 's#http://.*.ubuntu.com/#http://mirrors.tuna.tsinghua.edu.cn/#' /etc/apt/sources.list && \
    apt update && \
    apt install -y  \
        wget \
        libqt4-declarative \
        libqt4-network \
        libqt4-network \
        libqtgui4 \
        xdg-utils \
        nautilus \
        gedit \
        eog && \
    dpkg -i /root/dukto_6.0-1_amd64.deb && \
    apt install -f -y && \
    apt clean

ENTRYPOINT ["dukto"]

