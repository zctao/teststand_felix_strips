#!/bin/bash
# enable elinks
source $MyWorkDIR/configs/elinks/phase2_enable_elinks_daqload.sh

# run felixcore
felixcore -t 1 --data-interface lo --monitoring-interface eno2 -d 1