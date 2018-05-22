FROM ubuntu:16.04

MAINTAINER "Christopher Hartmann"

RUN apt-get update && apt-get install -y locales \
    && locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update \
    && apt-get install -y nginx curl git software-properties-common supervisor vim htop \
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y cron php5.6-fpm php5.6-cli php5.6-mcrypt php5.6-mbstring php5.6-gd php5.6-imagick php5.6-mysql php5.6-xml php5.6-curl php5.6-bcmath php5.6-zip php5.6-intl php5.6-sqlite php5.6-xdebug \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && mkdir /run/php \
    && apt-get remove -y --purge software-properties-common \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf \
    && rm /etc/php/5.6/cli/conf.d/20-xdebug.ini \
    && rm /etc/php/5.6/fpm/conf.d/20-xdebug.ini

# link nginx logs to stdout / stderr
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY conf/nginx /etc/nginx/sites-available/default
COPY conf/php-fpm.conf /etc/php/5.6/fpm/php-fpm.conf
COPY conf/php.ini /etc/php/5.6/fpm/php.ini
COPY conf/xdebug.ini /etc/php/5.6/mods-available/xdebug.ini
COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /var/www

EXPOSE 80 443

CMD ["/usr/bin/supervisord"]

