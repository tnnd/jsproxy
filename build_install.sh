#!/usr/bin/env bash

cd $(mktemp -d)

curl -O https://www.openssl.org/source/openssl-1.1.1b.tar.gz
tar zxf openssl-*

curl -O https://ftp.pcre.org/pub/pcre/pcre-8.43.tar.gz
tar zxf pcre-*

curl -O https://zlib.net/zlib-1.2.11.tar.gz
tar zxf zlib-*

curl -O https://openresty.org/download/openresty-1.15.8.1.tar.gz
tar zxf openresty-*
cd openresty-1.15.8.1

export PATH=$PATH:/sbin

./configure \
  --with-openssl=../openssl-1.1.1b \
  --with-pcre=../pcre-8.43 \
  --with-zlib=../zlib-1.2.11 \
  --with-http_v2_module \
  --with-http_ssl_module \
  --with-pcre-jit \
  --prefix=/root/server/openresty

make
make install
rm -r *