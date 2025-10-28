#!/bin/bash
set -e

echo "Generating Nginx config for ACTIVE_POOL=$ACTIVE_POOL..."
envsubst '$ACTIVE_POOL $BLUE_HOST $BLUE_PORT $GREEN_HOST $GREEN_PORT' \
  < /etc/nginx/nginx.conf.template \
  > /etc/nginx/nginx.conf

echo "Starting Nginx..."
nginx -g 'daemon off;'
