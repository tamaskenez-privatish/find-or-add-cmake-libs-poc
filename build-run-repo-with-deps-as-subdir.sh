#!/bin/bash -e

# configure, build and install libfoo for Debug and Release
BINDIR=b

rm -rf $BINDIR
cmake -B$BINDIR -H. -DCMAKE_BUILD_TYPE=Debug -DAIMOT_BUILD_INHOUSE_DEPS_FROM_SUBDIRS=1
cmake --build $BINDIR --config Debug

cd $BINDIR
ctest -C Debug
