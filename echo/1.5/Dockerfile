FROM ubuntu:16.04

MAINTAINER "Christopher Hartmann"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update \
    && apt-get install -y locales curl git vim htop software-properties-common sudo build-essential supervisor \
    && locale-gen en_US.UTF-8 \
    && curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
    && apt-get install -y nodejs locales curl git software-properties-common sudo build-essential supervisor \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && mkdir -p /var/www \
    && cd /var/www

RUN npm install -g laravel-echo-server@1.5

EXPOSE 6001

WORKDIR /var/www

CMD ["laravel-echo-server", "start"]
