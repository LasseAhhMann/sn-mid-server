FROM debian:buster-slim

LABEL maintainer="lkh@automize-software.com"

ADD asset/* /opt/

RUN apt-get -q update && apt-get install -qy unzip \
    supervisor \
    xmlstarlet \
    procps \
    wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    chmod 755 /opt/init && \
    rm -rf /tmp/*

ENTRYPOINT ["/opt/init"]

CMD ["mid:start"]
