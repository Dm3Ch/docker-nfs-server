FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq  \
    && apt-get install -y nfs-kernel-server nfs-common \
    && rm -rf /var/lib/apt/lists/* \
    && echo "nfs 2049/tcp" >> /etc/services

RUN mkdir /exports \
    && echo "/exports *(rw,sync,no_subtree_check,no_root_squash)" >> /etc/exports \
    && echo "Serving /exports" \
    && /usr/sbin/exportfs -a

EXPOSE 111/udp 2049/tcp

COPY run.sh /run.sh
ENTRYPOINT  [ "/run.sh" ]
