#!/bin/bash
lcgRelease=${1:-0}

if [[ "$lcgRelease" == 0 ]]; then
  #setupGCC9
  #source scl_source enable devtoolset-9; export CC=/usr/bin/gcc; export CXX=/usr/bin/g++;
  #setupGCC11
  source scl_source enable devtoolset-11; export CC=/usr/bin/gcc; export CXX=/usr/bin/g++;
else
  #source /cvmfs/sft.cern.ch/lcg/contrib/gcc/9/x86_64-centos7/setup.sh
  source /cvmfs/sft.cern.ch/lcg/contrib/gcc/11/x86_64-centos7/setup.sh
fi