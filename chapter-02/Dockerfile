FROM alpine:3.7

RUN apk --update add git less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

RUN wget -O /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.18.6/bin/linux/amd64/kubectl
RUN chmod +x /usr/local/bin/kubectl

VOLUME /workspace
WORKDIR /workspace
