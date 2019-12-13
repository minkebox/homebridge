#! /bin/sh

(cd /app ; npm --save install ${PACKAGES})

ACCESSORIES=$(cat /app/accessories-config.json)
PLATFORMS=$(cat /app/platforms-config.json)

cat /app/config.json | sed \
  -e "s/{{HOSTNAME}}/${HOSTNAME}/g" \
  -e "s/{{BRIDGE_USERNAME}}/${BRIDGE_USERNAME}/g" \
  -e "s/{{BRIDGE_PIN}}/${BRIDGE_PIN}/g" \
  -e "s/{{ACCESSORIES}}/${ACCESSORIES}/g" \
  -e "s/{{PLATFORMS}}/${PLATFORMS}/g" \
  > /app/homebridge/config.json
