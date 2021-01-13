FROM ubuntu:20.04

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
    && apt-get install -y cron php8.0-fpm php8.0-cli php8.0-mbstring php8.0-gd php8.0-imagick php8.0-mysql php8.0-xml php8.0-curl php8.0-bcmath php8.0-zip php8.0-intl php8.0-sqlite php8.0-xdebug php8.0-yaml php8.0-redis \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && mkdir /run/php \
    && apt-get remove -y --purge software-properties-common \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf \
    && rm /etc/php/8.0/cli/conf.d/20-xdebug.ini \
    && rm /etc/php/8.0/fpm/conf.d/20-xdebug.ini

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
