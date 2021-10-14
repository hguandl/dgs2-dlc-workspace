#!/bin/sh

set -e -o pipefail

ROMFS1_DIR="./build/rom_1_4"
ROMFS2_DIR="./build/rom_2_5"

cp ./pictures_tex/dlc_costumepack_BM_NOMIP_HQ.tex $ROMFS1_DIR/

cp ./pictures_tex/dlc_scenario00_BM_NOMIP_HQ.tex $ROMFS2_DIR/UI/tex/
cp ./pictures_tex/dlc_scenario01_BM_NOMIP_HQ.tex $ROMFS2_DIR/UI/tex/

cp ./pictures_tex/EVENT8_01_01_BM_NOMIP_HQ.tex $ROMFS2_DIR/UI/evt/
cp ./pictures_tex/EVENT8_05_01_big_BM_NOMIP_HQ.tex $ROMFS2_DIR/UI/evt/
cp ./pictures_tex/EVENT8_05_01_BM_NOMIP_HQ.tex $ROMFS2_DIR/UI/evt/
