#!/bin/bash
# 
# This script is intented to make a zip updated file for MX4Pro

DATA_IN_DIR="`pwd`/data-in"
OUTPUT_DIR="`pwd`/output"
TOOLS_DIR="`pwd`/tools"

# clean folder
rm -rf tmp/* 
rm -rf $OUTPUT_DIR/update.zip

# Copy system.img contents 
cp -vf $OUTPUT_DIR/system.transfer.list tmp/
cp -vf $OUTPUT_DIR/system.new.dat tmp/
cp -vf $OUTPUT_DIR/system.patch.dat tmp/

# Copy rom files and skip updated system.img contents
cp -rvn update/* tmp/

# Make zip
cd tmp; zip -r $OUTPUT_DIR/update.zip *
sudo chmod 664 $OUTPUT_DIR/update.zip
