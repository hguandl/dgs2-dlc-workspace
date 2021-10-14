#!/bin/bash

set -e -o pipefail

BIN="./external/bin"
DLC_FILE="./external/0004008C001AE200.cia"
REPACK_DIR="./build/repack"

mkdir -p $REPACK_DIR
$BIN/ctrtool --contents=$REPACK_DIR/Content $DLC_FILE

$BIN/3dstool -xvtf cfa $REPACK_DIR/Content.0001.00000004 --header $REPACK_DIR/Header_1_4.bin --romfs $REPACK_DIR/RomFS_1_4.bin --romfs-auto-key
$BIN/3dstool -xvtf cfa $REPACK_DIR/Content.0002.00000005 --header $REPACK_DIR/Header_2_5.bin --romfs $REPACK_DIR/RomFS_2_5.bin --romfs-auto-key

$BIN/3dstool -xvtf romfs $REPACK_DIR/RomFS_1_4.bin --romfs-dir build/rom_1_4
$BIN/3dstool -xvtf romfs $REPACK_DIR/RomFS_2_5.bin --romfs-dir build/rom_2_5
