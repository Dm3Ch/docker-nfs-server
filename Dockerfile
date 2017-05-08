FROM alpine:3.5

RUN apk --no-cache add nfs-utils

RUN mkdir /exports 

ADD startup.sh /startup.sh
ADD exports /etc/exports

EXPOSE 111/udp 2049/tcp

ENTRYPOINT  [ "/startup.sh" ]
