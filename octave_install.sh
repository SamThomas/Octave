#!/bin/bash
# create an installation directory
mkdir -p /usr/local/octave/dev
#setting appropriate permissions
chown jwe.jwe /usr/local/octave/dev
#create src and build directories
mkdir src build
#check out a copy of the octave sources in the src directory
cd src
hg clone http://hg.savannah.gnu.org/hgweb/octave
#bootstrap the build system
cd octave
./bootstrap
#build Octave in the build directory. choose whatever prefix is appropriate for your system. the -jN option builds in parallel
cd ../../build
cd ../src/octave/configure --prefix=/usr/local/octave/dev
make -j6 all
#Run the test suite
make check
#If everything looks OK (a few failures are probably normal for the development version) install it
make install
