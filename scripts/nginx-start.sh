#!/bin/bash

envsubst < /tmp/nginx.conf.template > /etc/nginx/nginx.conf
exec /usr/bin/runsvdir /etc/service
