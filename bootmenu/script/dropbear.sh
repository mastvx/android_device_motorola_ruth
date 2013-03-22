
######## BootMenu Script v0.6.1
######## Execute [SSH Daemon] Menu

export PATH=/sbin:/system/xbin:/system/bin

######## Main Script

######## Fix me..
#### killall dropbear
########

PATH=/sbin:/system/xbin ifconfig usb1 192.168.136.1 netmask 255.255.255.0 up

PATH=/sbin:/system/xbin /sbin/dropbear -H / -S -p 22 -r /sbin/dropbear.key.rsa -d /sbin/dropbear.key.dss -P /tmp/dropbear.pid -E -b /sbin/dropbear.banner -Y admin &

## dont exit, script included by adbd
#exit
