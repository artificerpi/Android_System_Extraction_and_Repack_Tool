#!/bin/sh
dd if=/sdcard/system.img of=/dev/block/platform/15540000.dwmmc0/by-name/system
echo "Finish updating system partition!"
dd if=/sdcard/recovery-uboot.img of=/dev/block/platform/15540000.dwmmc0/by-name/recovery
echo "Finish updating recovery partition!"
