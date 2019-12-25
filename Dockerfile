FROM registry.gitlab.com/minkebox/homebridge_base:latest

HEALTHCHECK --interval=60s --timeout=5s CMD /health.sh

COPY root/ /
