#!/bin/bash -e

BINDIR=$PWD/b
PREFIXDIR=$PWD/i
rm -rf $BINDIR $PREFIXDIR

./build-install-libfoo.sh

cp -R $PWD/i/libfoo_standalone/* $PREFIXDIR

cmake -B$BINDIR -H. -DCMAKE_BUILD_TYPE=Debug \
  -DAIMOT_BUILD_INHOUSE_DEPS_FROM_SUBDIRS=0 \
  -DCMAKE_PREFIX_PATH=$PREFIXDIR
cmake --build $BINDIR --config Debug

cd $BINDIR
ctest -C Debug
