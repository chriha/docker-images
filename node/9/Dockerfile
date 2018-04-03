FROM ubuntu:16.04

MAINTAINER "Christopher Hartmann"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update \
    && apt-get install -y locales curl git vim htop software-properties-common sudo build-essential libpng-dev libjpeg-dev libtool pkg-config nasm autoconf \
    && locale-gen en_US.UTF-8 \
    && apt-get remove -y --purge software-properties-common python3 \
    && apt-get install -y python2.7 python2.7-dev \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - \
    && apt-get install -y nodejs

EXPOSE 8080

WORKDIR /var/www

CMD ["node", "server.js"]
