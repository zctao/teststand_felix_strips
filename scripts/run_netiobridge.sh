#!/bin/bash

# Single chip
emuCtrl=configs/yarr/controller/emuCfg_star.json
emuChips=configs/yarr/emuConfig/example_Star_SingleChip.json
# Stave
#emuCtrl=configs/yarr/controller/emuCfg_star_stave.json
#emuChips=configs/yarr/emuConfig/example_Star_StripLSStave.json
# Petal
#emuCtrl=configs/yarr/controller/emuCfg_star_petal.json
#emuChips=configs/yarr/emuConfig/example_Star_StripPetal.json

# Start netio bridge
$YARRDIR/bin/netio_bridge -p 12341 -q 12350 -f $emuCtrl & pid_bridge=($!)
sleep 1

# Run scan
$YARRDIR/bin/scanConsole -r configs/yarr/controller/felix_netio_ubc.json -c $emuChips -s configs/yarr/scans/star/std_digitalStatic.json -p