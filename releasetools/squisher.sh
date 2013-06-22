# This script is included in squisher
# It is the final build step (after OTA package)

# Delete unwanted apps
rm -f $REPACK/ota/system/app/RomManager.apk
rm -f $REPACK/ota/system/app/Torch.apk
rm -f $REPACK/ota/system/app/CMWallpapers.apk
rm -f $REPACK/ota/system/app/Development.apk
rm -f $REPACK/ota/system/app/Protips.apk

mkdir -p $REPACK/ota/system/etc/terminfo/x
cp $REPACK/ota/system/etc/terminfo/l/linux $REPACK/ota/system/etc/terminfo/x/xterm

# prebuilt boot, devtree, logo & updater-script
cp -f $ANDROID_BUILD_TOP/device/motorola/ruth/updater-script $REPACK/ota/META-INF/com/google/android/updater-script