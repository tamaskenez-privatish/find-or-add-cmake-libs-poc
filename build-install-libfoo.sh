#!/bin/bash -e

# configure, build and install libfoo for Debug and Release
BINDIR=b/libfoo_standalone
INSTALLDIR=i/libfoo_standalone

cmake -B$BINDIR -Hlibfoo -DCMAKE_INSTALL_PREFIX=$INSTALLDIR -DCMAKE_DEBUG_POSTFIX=_d

for bt in Debug Release; do
  cmake $BINDIR -DCMAKE_BUILD_TYPE=$bt
  cmake --build $BINDIR --config $bt --target install
done
