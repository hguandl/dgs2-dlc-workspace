#!/bin/bash

set -e -o pipefail

GMD_EXE="python3 -m dgs2utils.gmd"
ROMFS_DIR="./build/rom_2_5"

$GMD_EXE repack -o $ROMFS_DIR/msg ./msg_dump
$GMD_EXE repack -o $ROMFS_DIR/script ./script_dump
