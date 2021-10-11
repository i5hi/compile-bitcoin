#!/bin/bash

sudo apt-get -y install build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 libevent-dev libboost-dev libboost-system-dev libboost-filesystem-dev libboost-test-dev libsqlite3-dev

mkdir ~/db4
sudo contrib/install_db4.sh ~/db4

git clone https://github.com/bitcoin/bitcoin.git
cd bitcoin

./autogen.sh
./configure BDB_LIBS="-L${BDB_PREFIX}/lib -ldb_cxx-4.8" BDB_CFLAGS="-I${BDB_PREFIX}/include"
make -j 4 # will use 4 CPU cores to build. Use more if you have available
sudo make install
