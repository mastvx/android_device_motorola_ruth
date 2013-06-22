#
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This is the product configuration for a generic Motorola Flipout (ruth)
#

# The gps config appropriate for this device

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

$(call inherit-product, vendor/motorola/ruth/ruth-vendor.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.media.capture.maxres=3m \
    ro.media.capture.fast.fps=4 \
    ro.media.capture.slow.fps=60 \
    ro.media.capture.classification=classE \
    ro.media.capture.useDFR=1 \
    ro.media.capture.maxres=3m \
    ro.media.capture.fast.fps=4 \
    ro.media.capture.slow.fps=60 \
    ro.media.capture.classification=classE \
    ro.media.capture.useDFR=1 \
    ro.media.camera.focal=2205.7,2205.7 \
    ro.media.camera.principal=1024.0,768.0 \
    ro.media.camera.skew=0.0 \
    ro.media.camera.distortion=0.0,0.0,0.0,0.0,0.0 \
    ro.mot.hw.HAC=1 \
    ro.hw.rotator=true \
    ro.com.google.locationfeatures=1 \
    ro.telephony.call_ring.multiple=false \
    ro.telephony.call_ring.delay=3000 \
    ro.url.safetylegal=http://www.motorola.com/staticfiles/Support/legal/?model=MB511 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.media.dec.aud.wma.enabled=1 \
    ro.media.dec.vid.wmv.enabled=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.dexopt-data-only=1 \

DEVICE_PACKAGE_OVERLAYS += device/motorola/ruth/overlay

PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml


# Wifi
PRODUCT_PACKAGES += \
	tiwlan.ini \
	wlan_cu \
	libtiOsLib \
	wlan_loader \
	libCustomWifi \
	wpa_supplicant.conf \
	dhcpcd.conf \
	iwmulticall \
#	hostap \
#	hostapd.conf \
#	libhostapdcli
#	tiap_loader \

# OMX
PRODUCT_PACKAGES += \
	dspexec \
	libbridge \
	libOMX.TI.AAC.encode \
	libOMX.TI.AAC.dncode \
	libOMX.TI.AMR.decode \
	libOMX.TI.AMR.encode \
	libOMX.TI.WBAMR.encode \
	libOMX.TI.MP3.decode \
	libOMX.TI.WBAMR.decode \
	libOMX.TI.WMA.decode \
	libOMX.TI.Video.Decoder \
	libOMX.TI.Video.encoder \
	libLCML \
	libOMX_Core \

# Core stuff
PRODUCT_PACKAGES += \
	overlay.omap3 \
	sensors.ruth \
	lights.ruth \
	gps.ruth \
	libfnc \
	libaudiopolicy \
	bootmenu \
	mot_boot_mode.bin \
	Usb \
	su \
        usbd \
	e2fsck \
	strace \
#	charge_only_mode \

# Live wallpaper packages
PRODUCT_PACKAGES += \
	librs_jni \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        VisualizationWallpapers

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
        packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# for jpeg hw encoder/decoder
PRODUCT_PACKAGES += libskiahw libOMX.TI.JPEG.Encoder libOMX.TI.JPEG.decoder

# hw video prepost processor (require dsp lib)
PRODUCT_PACKAGES += libOMX.TI.VPP

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_COPY_FILES += \
	device/motorola/ruth/vold.fstab:system/etc/vold.fstab \
	device/motorola/ruth/media_profiles.xml:system/etc/media_profiles.xml \

# copy all of our kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell test -d device/motorola/ruth/modules && \
	find device/motorola/ruth/modules -name '*.ko' \
	-printf '%p:system/lib/modules/%f ')

# Prebuilt boot.img
LOCAL_KERNEL := device/motorola/ruth/kernel
PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel
# Blobs

$(call inherit-product, device/motorola/ruth/ruth-blobs.mk)
$(call inherit-product, device/motorola/ruth/bootmenu/bootmenu.mk)
$(call inherit-product, build/target/product/full_base.mk)

# Should be after the full_base include, which loads languages_full
PRODUCT_LOCALES += \
	ldpi \
	mdpi 
