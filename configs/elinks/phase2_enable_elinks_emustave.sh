#!/bin/bash
link=${1:-00}
device=${2:-0}

echo "configuring link ${link}:"

echo "disabling IC and EC elinks"
# for now
flx-config -d ${device} set MINI_EGROUP_TOHOST_${link}_EC_ENCODING=0
flx-config -d ${device} set MINI_EGROUP_FROMHOST_${link}_EC_ENCODING=0
flx-config -d ${device} set MINI_EGROUP_TOHOST_${link}_EC_ENABLE=0
flx-config -d ${device} set MINI_EGROUP_FROMHOST_${link}_EC_ENABLE=0
flx-config -d ${device} set MINI_EGROUP_TOHOST_${link}_IC_ENABLE=0
flx-config -d ${device} set MINI_EGROUP_FROMHOST_${link}_IC_ENABLE=0

echo "enabling decoding elinks"
# To Host
for egroup in 0 1 2 3 4 5 6; do
    # 8b10b
    flx-config -d ${device} set DECODING_LINK${link}_EGROUP${egroup}_CTRL_PATH_ENCODING=0x0101
    # 320 Mbps
    flx-config -d ${device} set DECODING_LINK${link}_EGROUP${egroup}_CTRL_EPATH_WIDTH=0x2
    # enable rx 0, 2, 4, 6, ...
    flx-config -d ${device} set DECODING_LINK${link}_EGROUP${egroup}_CTRL_EPATH_ENA=0x5
done

echo "enabling encoding elinks"
# To FLX
for egroup in 0 1 2 3; do
    flx-config -d ${device} set ENCODING_LINK${link}_EGROUP${egroup}_CTRL_EPATH_ENA=0xff
done

echo "configuring timeout"
flx-config -d ${device} set TIMEOUT_CTRL_ENABLE=1
flx-config -d ${device} set TIMEOUT_CTRL_TIMEOUT=0xffffffff