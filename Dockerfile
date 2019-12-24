FROM registry.gitlab.com/minkebox/homebridge_base:latest

HEALTHCHECK --interval=60s --timeout=5s CMD pidof homebridge || exit 1

COPY root/ /
