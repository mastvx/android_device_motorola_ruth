#!/sbin/sh

######## BootMenu Script v0.8.0
######## Execute [Uninstall BootMenu] Menu


export PATH=/sbin:/system/xbin:/system/bin

######## Main Script

rm /system/bin/logwrapper
rm /system/bin/bootmenu
mv /system/bin/logwrapper.bin /system/bin/logwrapper

rm -r /system/bootmenu

exit
