#!/bin/bash

set -e -o pipefail

BIN="./external/bin"
REPACK_DIR="./build/repack"
OUTPUT_FILE="./build/dgs2-dlc-cn.cia"

$BIN/3dstool -cvtf romfs $REPACK_DIR/RepackRomFS_1_4.bin --romfs-dir ./build/rom_1_4
$BIN/3dstool -cvtf romfs $REPACK_DIR/RepackRomFS_2_5.bin --romfs-dir ./build/rom_2_5

$BIN/3dstool -cvtf cfa $REPACK_DIR/Repack.1.4 --header $REPACK_DIR/Header_1_4.bin --romfs $REPACK_DIR/RepackRomFS_1_4.bin --romfs-auto-key
$BIN/3dstool -cvtf cfa $REPACK_DIR/Repack.2.5 --header $REPACK_DIR/Header_2_5.bin --romfs $REPACK_DIR/RepackRomFS_2_5.bin --romfs-auto-key

$BIN/makerom -target p -dlc -ignoresign -f cia \
    -o $OUTPUT_FILE \
    -content $REPACK_DIR/Content.0000.00000003:0:3 \
    -content $REPACK_DIR/Repack.1.4:1:4 \
    -content $REPACK_DIR/Repack.2.5:2:5
