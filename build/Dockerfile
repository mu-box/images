ARG NAMESPACE=mubox
ARG TAG=latest
FROM ${NAMESPACE}/base:${TAG}

RUN apk add --virtual .build-deps --no-cache iptables rsync openssh-client pv gfortran

# RUN install-gh shon nos

# RUN get-hooks build

RUN chown -R gomicro:gomicro /asdf

WORKDIR /app

CMD [ "/sbin/microinit", "/bin/sleep", "365d" ]
