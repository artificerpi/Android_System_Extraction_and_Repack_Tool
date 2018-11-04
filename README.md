# Guide to customize your own Android

## Unpack(sdat2img)

* First Extract image files into `./data-in` folder  (`system.new.dat`, `system.patch.dat`, `system.transfer.list`)

For Android 8.1, you need to decompress the file `system.new.dat.br` into `system.new.dat` first.

```bash
# For Ubuntu
sudo apt install brotli

# in data-in folder
brotli -d  system.new.dat.br -f
```

* Now run `bash unpack.sh` to unpack rom files.

  Note that the owner of files in rom_system direcotry is `root`, don't just copy files into this folder.

## Update the `/system`

When you have done editing files in `rom_system`, unmount it by `sudo umount rom_system`.
Now you can push the `system.img` to Android by adb: `adb push system.img /sdcard/system.img`

In Android, install [connectBot](https://github.com/connectbot/connectbot) and open a local terminal with root, run `dd if=/sdcard/system.img of=<GET-THIS_PATH_FROM_updater-script>`
Wait for this command to finish, then your phone will have updated by you manually. 

### Use fastboot(you may need to unlock oem first)
**Connect your phone with debug mode**
``` sh
# reboot your to bootloader
adb reboot-bootloader
fastboot flash system system.img
```


## About customization
### build.prop
**Examples**
#### Enable soft keys navationbar
- *4.0+* required

add line `qemu.hw.mainkeys=0`

### Remove app
#### priv-app vs app
The essential apps like dialer, message, camera should be under priv-app folder 

### Customize in your phone directly
**Modify files under `/system` in Android (root required)**
``` sh
mount -o rw,remount /dev/block/mtdblock1 /system
// Now you can make some modification under /system directory
// eg. rm system/xbin/su
mount -o ro,remount /dev/block/mtdblock1 /system
```
