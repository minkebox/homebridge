#! /bin/sh

if [ "${PACKAGES}" != "" ]; then
  (cd /app ; npm --save install ${PACKAGES})
fi

cat /app/config.json | sed \
  -e "s/{{HOSTNAME}}/${HOSTNAME}/g" \
  -e "s/{{BRIDGE_USERNAME}}/${BRIDGE_USERNAME}/g" \
  -e "s/{{BRIDGE_PIN}}/${BRIDGE_PIN}/g" \
  -e "/{{ACCESSORIES}}/r /app/accessories-config.json" -e "s/{{ACCESSORIES}}//" \
  -e "/{{PLATFORMS}}/r /app/platforms-config.json" -e "s/{{PLATFORMS}}//" \
  > /app/homebridge/config.json
