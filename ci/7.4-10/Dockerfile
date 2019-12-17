FROM ubuntu:19.04

MAINTAINER "Christopher Hartmann"

RUN apt-get update && apt-get install -y locales \
    && locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y curl git software-properties-common vim htop openssh-client unzip \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y php7.4-cli php7.4-mbstring php7.4-gd php7.4-imagick php7.4-mysql php7.4-xml php7.4-curl php7.4-bcmath php7.4-zip php7.4-intl php7.4-sqlite \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && mkdir /run/php \
    && apt-get remove -y --purge software-properties-common \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && curl -sL https://deb.nodesource.com/setup_11.x | bash - \
    && apt-get install -y nodejs

WORKDIR /var/www

CMD ["bash"]
