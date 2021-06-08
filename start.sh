#!/bin/bash

cd /tmp
WORKDIR="/opt/profittrailer"
INSTALLED="$WORKDIR/.installed"

if [ ! -f "$INSTALLED" ]; then
    wget $(curl -s https://api.github.com/repos/taniman/profit-trailer/releases/latest | grep "browser_download_url.*zip" | cut -d : -f 2,3 | tr -d \")
    unzip -j ProfitTrailer*.zip -d "$WORKDIR"
    touch "$INSTALLED"
fi

cd "$WORKDIR"
java -Djava.net.preferIPv4Stack=true -Dsun.stdout.encoding=UTF-8 -Dio.netty.allocator.numDirectArenas=0 -Djdk.nio.maxCachedBufferSize=262144 -XX:+UseSerialGC -XX:+UseStringDeduplication -Xms128m -Xmx1024m -XX:CompressedClassSpaceSize=300m -XX:MaxMetaspaceSize=128m -jar ProfitTrailer.jar
