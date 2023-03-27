ARG NAMESPACE=mubox
ARG TAG=latest
FROM ${NAMESPACE}/base:${TAG}

RUN apk add --virtual .code-deps --no-cache nfs-utils gfortran libgomp

# RUN get-hooks code

RUN chown -R gomicro:gomicro /asdf

WORKDIR /app
