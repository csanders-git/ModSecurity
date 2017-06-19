FROM fedora:25
MAINTAINER Chaim Sanders chaim.sanders@gmail.com

RUN dnf -y update && \
  dnf install -y git \
  libtool \
  gcc-c++ \
  GeoIP-devel \
  libxml2-devel \
  curl-devel \
  lmdb-devel \
  yajl-devel \
  pcre-devel

RUN mkdir -p /usr/share/ModSecurity && \
  cd /usr/share/ModSecurity && \
  git clone https://github.com/SpiderLabs/ModSecurity && \
  cd ModSecurity && \
  git checkout v3/master

RUN cd /usr/share/ModSecurity/ModSecurity && \
  sh ./build.sh && \
  git submodule init && \
  git submodule update && \
  ./configure && \
  make && \
  make install

EXPOSE 80
