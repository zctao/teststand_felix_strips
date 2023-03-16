#!/bin/bash
if [[ -z "${MyWorkDIR}" ]]; then
  echo 'MyWorkDIR is not set. Run setup_env.sh first'
  exit
fi

cd ${MyWorkDIR}

git clone -b devel https://gitlab.cern.ch/YARR/YARR.git Yarr

export YARRDIR=${MyWorkDIR}/Yarr

source ${MyWorkDIR}/scripts/compile_yarr.sh $YARRDIR 1