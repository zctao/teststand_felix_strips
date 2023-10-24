#!/bin/bash
yarrDir=${1:-${TSWorkDIR}/Yarr}
updateSrc=${2:-0}

function install_yarr {
  git clone -b devel https://gitlab.cern.ch/YARR/YARR.git $yarrDir
}

function compile_yarr {
  # update if required
  if [ "$updateSrc" -ne 0 ]; then
    git pull
  fi

  # compile
  # gcc 11 from LCG release
  source ${TSWorkDIR}/scripts/setup_gcc.sh 1

  cmake3 -S $yarrDir -B $yarrDir/build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=cmake/linux-gcc -DYARR_CONTROLLERS_TO_BUILD="Spec;Emu;StarEmu;Fei4Emu;Rd53aEmu;NetioHW;FelixClient;ItsdaqFW" -DYARR_FRONT_ENDS_TO_BUILD=all -DBUILD_TESTS=on
  # or build all
  #cmake3 -S $yarrDir -B $yarrDir/build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=cmake/linux-gcc -DYARR_CONTROLLERS_TO_BUILD=all -DYARR_FRONT_ENDS_TO_BUILD=all -DBUILD_TESTS=on

  cmake3 --build $yarrDir/build -j16
  cmake3 --install $yarrDir/build
}

if [ ! -d $yarrDir ]; then
  echo "$yarrDir does not exist!"
  read -r -p "Install YARR to $yarrDir? [y/N]" install
  install=${install,,}    # lower case
  if [[ "$install" =~ ^(yes|y)$ ]]; then
    install_yarr
    compile_yarr
    export YARRDIR=$yarrDir 
  fi
else
  echo "Use YARR in $yarrDir"
  read -r -p "Compile YARR? [y/N]" compile
  compile=${compile,,}
  if [[ "$compile" =~ ^(yes|y)$ ]]; then
    compile_yarr
  fi
  export YARRDIR=$yarrDir
fi


