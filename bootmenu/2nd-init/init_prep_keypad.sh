#!/system/bin/sh
export PATH=/system/bin:$PATH
mount -o remount,rw / /system
if [ -e /proc/device-tree/System@0/Keypad@0/name ]; then
	keypad_name=`cat /proc/device-tree/System@0/Keypad@0/name`
	if [ "x$keypad_name" != "x" ]; then
		ln -sf /system/usr/keylayout/$keypad_name.kl /system/usr/keylayout/sholes-keypad.kl
		ln -sf /system/usr/keychars/$keypad_name.kcm.bin /system/usr/keychars/sholes-keypad.kcm.bin
		rm /system/usr/keylayout/qwerty.kl
		ln -sf /system/usr/keylayout/$keypad_name.kl /system/usr/keylayout/qwerty.kl
		rm /system/usr/keychars/qwerty.kcm.bin
		rm /system/usr/keychars/qwerty2.kcm.bin
		ln -sf /system/usr/keychars/$keypad_name.kcm.bin /system/usr/keychars/qwerty.kcm.bin
		ln -sf /system/usr/keychars/$keypad_name.kcm.bin /system/usr/keychars/qwerty2.kcm.bin
	fi
fi
mount -o remount,ro / /system