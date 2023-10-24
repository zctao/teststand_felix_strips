#!/bin/bash
link=${1:-00}
device=${2:-0}

echo "configuring link ${link}:"

echo "configuring AMAC elinks"
# No AMAC on the DAQLoad
flx-config -d ${device} set MINI_EGROUP_TOHOST_${link}_EC_ENCODING=0
flx-config -d ${device} set MINI_EGROUP_FROMHOST_${link}_EC_ENCODING=0
flx-config -d ${device} set MINI_EGROUP_TOHOST_${link}_EC_ENABLE=0
flx-config -d ${device} set MINI_EGROUP_FROMHOST_${link}_EC_ENABLE=0
flx-config -d ${device} set MINI_EGROUP_TOHOST_${link}_IC_ENABLE=0
flx-config -d ${device} set MINI_EGROUP_FROMHOST_${link}_IC_ENABLE=0

echo "enabling decoding elinks"
# To Host
# phase2 decoder is currently hardcoded as 8b10b, 320 Mbps
flx-config -d ${device} set DECODING_LINK${link}_EGROUP0_CTRL_PATH_ENCODING=1

flx-config -d ${device} set DECODING_LINK${link}_EGROUP0_CTRL_EPATH_WIDTH=0x02
flx-config -d ${device} set DECODING_LINK${link}_EGROUP1_CTRL_EPATH_WIDTH=0x02
flx-config -d ${device} set DECODING_LINK${link}_EGROUP2_CTRL_EPATH_WIDTH=0x02
flx-config -d ${device} set DECODING_LINK${link}_EGROUP3_CTRL_EPATH_WIDTH=0x02
flx-config -d ${device} set DECODING_LINK${link}_EGROUP4_CTRL_EPATH_WIDTH=0x02
flx-config -d ${device} set DECODING_LINK${link}_EGROUP5_CTRL_EPATH_WIDTH=0x02
flx-config -d ${device} set DECODING_LINK${link}_EGROUP6_CTRL_EPATH_WIDTH=0x02

flx-config -d ${device} set DECODING_LINK${link}_EGROUP0_CTRL_EPATH_ENA=0xff
flx-config -d ${device} set DECODING_LINK${link}_EGROUP1_CTRL_EPATH_ENA=0xff
flx-config -d ${device} set DECODING_LINK${link}_EGROUP2_CTRL_EPATH_ENA=0xff
flx-config -d ${device} set DECODING_LINK${link}_EGROUP3_CTRL_EPATH_ENA=0xff
flx-config -d ${device} set DECODING_LINK${link}_EGROUP4_CTRL_EPATH_ENA=0xff
flx-config -d ${device} set DECODING_LINK${link}_EGROUP5_CTRL_EPATH_ENA=0xff
flx-config -d ${device} set DECODING_LINK${link}_EGROUP6_CTRL_EPATH_ENA=0xff

echo "enabling encoding elinks"
# To FLX
flx-config -d ${device} set ENCODING_LINK${link}_EGROUP0_CTRL_EPATH_ENA=0xff
flx-config -d ${device} set ENCODING_LINK${link}_EGROUP1_CTRL_EPATH_ENA=0xff
flx-config -d ${device} set ENCODING_LINK${link}_EGROUP2_CTRL_EPATH_ENA=0xff
flx-config -d ${device} set ENCODING_LINK${link}_EGROUP3_CTRL_EPATH_ENA=0xff

echo "configuring timeout"
flx-config -d ${device} set TIMEOUT_CTRL_ENABLE=1
flx-config -d ${device} set TIMEOUT_CTRL_TIMEOUT=0xffffffff