#!/bin/bash
yarrDir=${1:-${MyWorkDIR}/Yarr}
updateSrc=${2:-0}

if [ ! -d $yarrDir ]; then
  echo "$yarrDir does not exist!"
  exit 1
else
  echo "Using $yarrDir"
  export YARRDIR=$yarrDir
fi

cwd=${PWD}

cd ${yarrDir}

# update if required
if [ "$updateSrc" -ne 0 ]; then
  git pull
fi

# compile
cmake3 -S . -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=cmake/linux-gcc -DYARR_CONTROLLERS_TO_BUILD="Spec;Emu;StarEmu;Fei4Emu;Rd53aEmu;NetioHW;FelixClient;ItsdaqFW" -DYARR_FRONT_ENDS_TO_BUILD=all -DBUILD_TESTS=on
# or build all
#cmake3 -S . -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=cmake/linux-gcc -DYARR_CONTROLLERS_TO_BUILD=all -DYARR_FRONT_ENDS_TO_BUILD=all -DBUILD_TESTS=on

cmake3 --build build -j16
cmake3 --install build

cd ${cwd}