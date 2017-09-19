#!/bin/bash

DATA_IN_DIR="`pwd`/data-in"
OUTPUT_DIR="`pwd`/output"
TOOLS_DIR="`pwd`/tools"

# Setup output dir
mkdir -p $OUTPUT_DIR
rm -rf $OUTPUT_DIR/*

echo "Converting sdat file to img"
$TOOLS_DIR/sdat2img.py $DATA_IN_DIR/system.transfer.list $DATA_IN_DIR/system.new.dat $OUTPUT_DIR/system.img

echo "Mounting img to a folder"
mkdir -p rom_system
sudo mount -t ext4 -o loop $OUTPUT_DIR/system.img rom_system/

echo "Unpacking is done. Please edit files in rom_system folder to customize the rom."

echo "Notes: You should edit this files with root priviledge, please DO NOT modify any files you don't know."

