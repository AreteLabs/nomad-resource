FROM gliderlabs/alpine:3.3

ENV NOMAD_VERSION=0.5.6
ENV GLIBC_VERSION "2.23-r1"

RUN apk add curl bash jq coreutils --no-cache
RUN curl -Ls https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk > /tmp/glibc-${GLIBC_VERSION}.apk && \
    apk add --allow-untrusted /tmp/glibc-${GLIBC_VERSION}.apk

ADD https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip nomad.zip
RUN unzip nomad.zip
RUN mv nomad /usr/bin/nomad
RUN chmod +x /usr/bin/nomad

COPY bin/check /opt/resource/check
COPY bin/in /opt/resource/in
COPY bin/out /opt/resource/out
COPY bin/common.sh /opt/resource/common.sh
