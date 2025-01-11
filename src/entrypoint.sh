#!/bin/bash

# fetch and setup IP
if [ -z "$PUBLIC_DOMAIN" ]; then
  PUBLIC_DOMAIN=http://$(curl -s https://checkip.amazonaws.com):$PORT
  export PUBLIC_DOMAIN
  echo "setting PUBLIC_DOMAIN to $PUBLIC_DOMAIN"
fi

if [ "$#" -eq 0 ]; then
  exec /app/sophon-node \
    ${OPERATOR_ADDRESS:+--operator $OPERATOR_ADDRESS} \
    ${DESTINATION_ADDRESS:+--destination $DESTINATION_ADDRESS} \
    ${PERCENTAGE:+--percentage $PERCENTAGE} \
    ${IDENTITY:+--identity $IDENTITY} \
    ${PUBLIC_DOMAIN:+--public-domain $PUBLIC_DOMAIN} \
    ${MONITOR_URL:+--monitor-url $MONITOR_URL} \
    ${NETWORK:+--network $NETWORK} \
    ${AUTO_UPGRADE:+--auto-upgrade $AUTO_UPGRADE}
else
  exec "$@"
fi
