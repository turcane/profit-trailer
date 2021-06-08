FROM adoptopenjdk/openjdk8:alpine

EXPOSE 8081

VOLUME /opt/profittrailer

RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*

COPY start.sh /opt/profittrailer/start.sh

CMD ["/bin/sh", "/opt/profittrailer/start.sh"]