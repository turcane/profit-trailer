FROM adoptopenjdk/openjdk8:alpine

EXPOSE 8081

VOLUME /opt/profittrailer

RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*


COPY start.sh /start.sh
CMD ["/bin/sh", "/start.sh"]