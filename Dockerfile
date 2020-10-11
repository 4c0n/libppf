FROM fedora:32

WORKDIR /app/libppf

RUN dnf install -y \
        autoconf \
        automake \
        libtool \
        g++ \
        make \
        tcl-devel \
        diffutils \
    ; \
    dnf clean all;

COPY . /app/libppf

RUN set -eux; \
    automake --add-missing && ls -lah; \
    autoreconf; \
    ./configure; \
    make; \
    make check; \
    make install;
