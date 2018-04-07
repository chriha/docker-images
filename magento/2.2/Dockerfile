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
    && apt-get install -y cron php7.1-fpm php7.1-cli php7.1-mcrypt php7.1-mbstring php7.1-gd php7.1-imagick php7.1-mysql php7.1-xml php7.1-curl php7.1-bcmath php7.1-zip php7.1-intl php7.1-xdebug php7.1-soap \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && mkdir /run/php \
    && apt-get remove -y --purge software-properties-common \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf \
    && sed -ri 's/^www-data:x:33:33:/www-data:x:1000:1000:/' /etc/passwd \
    && rm /etc/php/7.1/cli/conf.d/20-xdebug.ini \
    && rm /etc/php/7.1/fpm/conf.d/20-xdebug.ini

# link nginx logs to stdout / stderr
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY conf/nginx /etc/nginx/sites-available/default
COPY conf/php-fpm.conf /etc/php/7.1/fpm/php-fpm.conf
COPY conf/php.ini /etc/php/7.1/fpm/php.ini
COPY conf/xdebug.ini /etc/php/7.1/mods-available/xdebug.ini
COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR /var/www

EXPOSE 80 443

CMD ["/usr/bin/supervisord"]
