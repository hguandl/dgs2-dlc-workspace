#!/bin/bash

set -e -o pipefail

sudo apt-get update
sudo apt-get install -y cmake ninja-build

git clone https://github.com/3DSGuy/Project_CTR.git
pushd Project_CTR
pushd ctrtool
make
popd
pushd makerom
make
popd
popd

git clone https://github.com/dnasdw/3dstool.git
pushd 3dstool
mkdir build
pushd build
cmake -GNinja ..
ninja
popd
popd

mkdir bin
cp ./Project_CTR/ctrtool/ctrtool ./bin/
cp ./Project_CTR/makerom/makerom ./bin/
cp ./3dstool/bin/Release/3dstool ./bin/

tar zcf rom_tools.tar.gz ./bin
