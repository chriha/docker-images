FROM ubuntu:19.04

MAINTAINER "Christopher Hartmann"

RUN apt-get update && apt-get install -y locales \
    && locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y nginx curl git software-properties-common supervisor vim htop \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y cron php7.3-fpm php7.3-cli php7.3-mbstring php7.3-gd php7.3-imagick php7.3-mysql php7.3-xml php7.3-curl php7.3-bcmath php7.3-zip php7.3-intl php7.3-sqlite php7.3-xdebug php7.3-yaml \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && mkdir /run/php \
    && apt-get remove -y --purge software-properties-common \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf \
    && rm /etc/php/7.3/cli/conf.d/20-xdebug.ini \
    && rm /etc/php/7.3/fpm/conf.d/20-xdebug.ini

# link nginx logs to stdout / stderr
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY conf/nginx /etc/nginx/sites-available/default
COPY conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY conf/php.ini /etc/php/7.3/fpm/php.ini
COPY conf/xdebug.ini /etc/php/7.3/mods-available/xdebug.ini
COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /var/www

EXPOSE 80 443

CMD ["/usr/bin/supervisord"]
