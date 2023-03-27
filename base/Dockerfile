FROM alpine

LABEL maintainer="Microbox Developers <devs@microbox.cloud>"
LABEL updated_at=2022-02-26

RUN apk add --virtual .asdf-deps --no-cache bash curl git
SHELL ["/bin/bash", "-l", "-c"]
RUN adduser -s /bin/bash -h /home -D gomicro

ENV PATH="${PATH}:/asdf/data/shims:/asdf/bin"
ENV ASDF_DIR=/asdf
ENV ASDF_DATA_DIR=/asdf/data
RUN git clone --depth 1 https://github.com/asdf-vm/asdf /asdf

RUN apk add --virtual .microbox-deps --no-cache wget tar vim nano sudo \
    net-tools netcat-openbsd iproute2 iputils musl-locales musl-locales-lang \
    tzdata ncurses runit openssh alpine-sdk ruby-dev ruby-bundler

RUN gem install micro-hookit

# setup runit
RUN mkdir -p /etc/service
RUN ln -s /etc/service /service

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en
ENV TERM xterm

COPY files/. /

RUN install-gh microinit narc # siphon

RUN chown -R gomicro:gomicro /asdf /home
RUN mkdir -p /root/.ssh && \
    chmod 0700 /root && \
    chmod 0700 /root/.ssh && \
    chmod 0644 /etc/ssh/sshd_config && \
    ( passwd -u root || true )

# Update locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

CMD ["/sbin/microinit"]
