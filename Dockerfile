FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    automake \
    build-essential \
    dbus-x11 \
    git \
    libx11-dev && \
    apt clean

RUN git clone https://git.code.sf.net/p/gnuplot/gnuplot-main /tmp/gnuplot

WORKDIR /tmp/gnuplot

RUN ./prepare && \
    # --with-readline=bsd
    ./configure && \
    make && \
    make install

WORKDIR /root

RUN rm -rf /tmp/gnuplot
