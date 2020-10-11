FROM fedora:32

WORKDIR /app/libppf

RUN dnf install -y \
        autoconf \
        automake \
        libtool \
        g++ \
        make \
    ; \
    dnf clean all;

COPY . /app/libppf

RUN set -eux; \
    autoreconf; \
    ./configure; \
    make; \
    make install;
