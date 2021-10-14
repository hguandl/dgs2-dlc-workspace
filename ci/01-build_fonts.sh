#!/bin/sh

set -e -o pipefail

FONT_DB_EXE="python3 -m dgs2utils.font_db"
GFD_EXE="python3 -m dgs2utils.gfd"

FONT_RES_DIR="./build/font_res"
ROMFS_DIR="./build/rom_2_5"

mkdir -p $FONT_RES_DIR
$GFD_EXE dump -o $FONT_RES_DIR $ROMFS_DIR/font/font00_jpn.gfd
$GFD_EXE dump -o $FONT_RES_DIR $ROMFS_DIR/font/font01_jpn.gfd
$GFD_EXE dump -o $FONT_RES_DIR $ROMFS_DIR/font/font02_jpn.gfd
$GFD_EXE dump -o $FONT_RES_DIR $ROMFS_DIR/font/font03_jpn.gfd

$FONT_DB_EXE count -d ./msg_dump -o $FONT_RES_DIR/msg_text.json
$FONT_DB_EXE count -d ./script_dump -o $FONT_RES_DIR/script_text.json

$FONT_DB_EXE merge -o $FONT_RES_DIR/font00_jpn_list.json \
    ./font_acg/font00_acg.json $FONT_RES_DIR/script_text.json
$FONT_DB_EXE merge -o $FONT_RES_DIR/font01_jpn_list.json \
    ./font_acg/font01_acg.json $FONT_RES_DIR/msg_text.json
$FONT_DB_EXE merge -o $FONT_RES_DIR/font02_jpn_list.json \
    ./font_acg/font02_acg.json $FONT_RES_DIR/msg_text.json
cp font_acg/font03_acg.json $FONT_RES_DIR/font03_jpn_list.json

$GFD_EXE generate -i $FONT_RES_DIR -f ./external/ttf/hanyi-65s.ttf -n 00 -o $ROMFS_DIR/font
$GFD_EXE generate -i $FONT_RES_DIR -f ./external/ttf/dayasong.ttf -n 01 -o $ROMFS_DIR/font
$GFD_EXE generate -i $FONT_RES_DIR -f ./external/ttf/dayasong.ttf -n 02 -o $ROMFS_DIR/font
$GFD_EXE generate -i $FONT_RES_DIR -f ./external/ttf/SourceHanSans-Bold.otf -n 03 -o $ROMFS_DIR/font
