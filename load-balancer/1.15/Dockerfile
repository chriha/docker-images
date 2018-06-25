FROM nginx:1.15

MAINTAINER "Christopher Hartmann"

RUN apt-get update \
    && apt-get install -y dnsutils \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# link nginx logs to stdout / stderr
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY scripts/add_upstreams.sh /etc/nginx/add_upstreams.sh

CMD /etc/nginx/add_upstreams.sh && /usr/sbin/nginx -g "daemon off;"

