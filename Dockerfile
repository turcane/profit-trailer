FROM adoptopenjdk/openjdk8:alpine

EXPOSE 8081

VOLUME /opt/profittrailer

RUN apk add --update \
    curl \
    ca-certificates \
    && rm -rf /var/cache/apk/* \
    && update-ca-certificates

COPY start.sh /start.sh
CMD ["/bin/sh", "/start.sh"]