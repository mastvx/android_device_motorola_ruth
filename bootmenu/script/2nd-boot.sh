#!/sbin/sh

######## BootMenu Script
######## Execute [2nd-boot] Menu

strace /system/bootmenu/2nd-boot/runhbootmod.sh
#strace /system/bootmenu/2nd-boot/run.sh
#give the 2ndboot.ko some time to load everything 
sleep 10 
