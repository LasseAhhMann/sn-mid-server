FROM alpine:3

LABEL maintainer="lkh@automize-software.com"

ADD asset/* /opt/

RUN apk update && apk add --no-cache unzip \
    supervisor \
    xmlstarlet \
    wget && \
    chmod 755 /opt/init

ENTRYPOINT ["/opt/init"]

CMD ["mid:start"]
