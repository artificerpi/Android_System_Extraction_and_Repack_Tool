#!/bin/bash

DATA_IN_DIR="`pwd`/data-in"
OUTPUT_DIR="`pwd`/output"
TOOLS_DIR="`pwd`/tools"

echo "Make ext4fs"
sudo $TOOLS_DIR/make_ext4fs -s -T -1 -S $DATA_IN_DIR/file_contexts -L system -l 2692743168 -a system $OUTPUT_DIR/system-new.img rom_system/
echo "Converting img to sdat (Lollipop)"
python $TOOLS_DIR/img2sdat/img2sdat.py $OUTPUT_DIR/system-new.img $OUTPUT_DIR/ 2

echo -e "\t Run command: 'sudo umount rom_system/' when you finish this job. "
