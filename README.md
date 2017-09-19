# Guide to customize your own Android

## build.prop
### Enable soft keys navationbar
- *4.0+* required

add line `qemu.hw.mainkeys=0`

## Remove app
### priv-app vs app
The essential apps like dialer, message, camera should be under priv-app folder 

## Unroot
mount -o rw,remount /dev/block/mtdblock1 /system
rm recovery.img
mount -o ro,remount /dev/block/mtdblock1 /system

rm system/xbin/su
