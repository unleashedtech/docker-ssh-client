FROM alpine:3.4
MAINTAINER Colin O'Dell <codell@unleashed-technologies.com>

RUN apk add --update openssh-client && \
    rm -rf /var/cache/apk/* && \
    adduser tunnel -Du 1000 -h /home && \
    mkdir /home/.ssh && \
    chmod 0700 /home/.ssh && \
    chown -R tunnel /home

USER tunnel
WORKDIR /home

VOLUME ["/home/.ssh"]
ENTRYPOINT ["/usr/bin/ssh", "-T", "-N", "-o", "StrictHostKeyChecking=false", "-o", "ServerAliveInterval=180"]
