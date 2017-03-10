FROM alpine:3.4
MAINTAINER Colin O'Dell <codell@unleashed-technologies.com>

RUN apk add --update openssh-client && \
    rm -rf /var/cache/apk/* && \
    adduser sshuser -Du 1000 -h /home && \
    mkdir /home/.ssh && \
    chmod 0700 /home/.ssh && \
    chown -R sshuser /home && \
    echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > /home/.ssh/config

USER sshuser
WORKDIR /home
