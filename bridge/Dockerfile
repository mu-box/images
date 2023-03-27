ARG NAMESPACE=mubox
ARG TAG=latest
FROM ${NAMESPACE}/base:${TAG}

RUN apk add --virtual .bridge-deps --no-cache iputils iproute2 openvpn easy-rsa rsync

RUN mkdir -p /asdf/data/share/microbox && \
    cp -r /usr/share/easy-rsa/{openssl-easyrsa.cnf,vars.example,x509-types{,/{COMMON,ca,client,server}}} /asdf/data/share/microbox && \
    cd /asdf/data/share/microbox && \
    /usr/share/easy-rsa/easyrsa --batch init-pki && \
    /usr/share/easy-rsa/easyrsa --batch --req-cn="Microbox" build-ca nopass && \
    /usr/share/easy-rsa/easyrsa --batch gen-dh && \
    /usr/share/easy-rsa/easyrsa --batch build-server-full server nopass && \
    /usr/share/easy-rsa/easyrsa --batch build-client-full client1 nopass

RUN chown -R gomicro:gomicro /asdf

# RUN get-hooks bridge

WORKDIR /asdf/data
