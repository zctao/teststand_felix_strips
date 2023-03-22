#!/bin/bash
chipType=${1:-Star} # Star, Star_vH0A0, Star_vH0A1, Star_vH1A1

# Single chip
$YARRDIR/bin/createConfig -t ${chipType} -s SingleChip -o configs/yarr/emuConfig -n emuStar
# Long strip stave
$YARRDIR/bin/createConfig -t ${chipType} -s StripLSStave -o configs/yarr/emuConfig -n emuStar
# Petal
$YARRDIR/bin/createConfig -t ${chipType} -s StripPetal -o configs/yarr/emuConfig -n emuStar