#!/bin/bash

# fetch and setup IP
if [ -z "$PUBLIC_DOMAIN" ]; then
  PUBLIC_DOMAIN=http://$(curl -s https://checkip.amazonaws.com):$PORT
  export PUBLIC_DOMAIN
  echo "setting PUBLIC_DOMAIN to $PUBLIC_DOMAIN"
fi

exec "$@"
