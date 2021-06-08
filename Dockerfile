FROM adoptopenjdk/openjdk8:debian

EXPOSE 8081

VOLUME /opt/profittrailer

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip

COPY start.sh /start.sh
CMD ["/bin/sh", "/start.sh"]