FROM ubuntu:20.04

MAINTAINER "Christopher Hartmann"

RUN apt-get update && apt-get install -y locales language-pack-en-base \
    && locale-gen en_US.UTF-8

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y nginx curl git software-properties-common supervisor vim htop \
    && LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y cron php8.1-fpm php8.1-cli php8.1-mbstring php8.1-gd php8.1-imagick php8.1-mysql php8.1-xml php8.1-curl php8.1-bcmath php8.1-zip php8.1-intl php8.1-sqlite php8.1-xdebug php8.1-yaml php8.1-redis \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && mkdir /run/php \
    && apt-get remove -y --purge software-properties-common \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf \
    && rm /etc/php/8.1/cli/conf.d/20-xdebug.ini \
    && rm /etc/php/8.1/fpm/conf.d/20-xdebug.ini

# link nginx logs to stdout / stderr
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY conf/nginx /etc/nginx/sites-available/default
COPY conf/php-fpm.conf /etc/php/8.0/fpm/php-fpm.conf
COPY conf/php.ini /etc/php/8.0/fpm/php.ini
COPY conf/xdebug.ini /etc/php/8.0/mods-available/xdebug.ini
COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /var/www

EXPOSE 80 443

CMD ["/usr/bin/supervisord"]
