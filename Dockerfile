FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
ENV TZ America/Los_Angeles

RUN \
    apt-get update -qq && \
    apt-get install -qqy tzdata mlocate hollywood && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && \
    dpkg-reconfigure tzdata && \
    updatedb

ENTRYPOINT ["hollywood"]
