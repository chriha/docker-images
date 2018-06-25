#!/usr/bin/env bash
dig web a | grep '^web.' | awk '{ print "server "$5";" }' > /etc/nginx/upstreams.conf

