#!/bin/bash
config=${1:-$TSWorkDIR/configs/felix-star/supervisord_tcp.conf}

# enable elinks
source $TSWorkDIR/configs/elinks/phase2_enable_elinks_daqload.sh

# make log directory
mkdir -p logs

# start supervisor and run felix-star processes
supervisord -c $config
#supervisorctl status
supervisorctl start daq:*
supervisorctl status