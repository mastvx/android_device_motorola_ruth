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

DEVICE_PATH = device/motorola/ruth

DEVICE_PREBUILT := ${DEVICE_PATH}/prebuilt

#key layouts, names must fit the ones in /proc/bus/input/devices, qwerty.kl is the fallback one.
PRODUCT_COPY_FILES += \
	${DEVICE_PREBUILT}/app/AudioEffectSettings.apk:system/app/AudioEffectSettings.apk \
	${DEVICE_PREBUILT}/bin/mot_boot_mode:system/bin/mot_boot_mode \
	${DEVICE_PREBUILT}/bin/fixDelSystem.sh:system/bin/fixDelSystem.sh \
	${DEVICE_PREBUILT}/bin/install2ndInit.sh:system/bin/install2ndInit.sh \
	${DEVICE_PREBUILT}/etc/wifi/tiwlan.ini:system/etc/wifi/tiwlan.ini \
	${DEVICE_PREBUILT}/framework/com.motorola.android.location.jar:system/framework/com.motorola.android.location.jar \
	${DEVICE_PATH}/mb508/lib/libcamera.so:obj/lib/libcamera.so \
	${DEVICE_PATH}/mb508/lib/libcamera.so:system/lib/libcamera.so \
	${DEVICE_PATH}/mb508/lib/libgki.so:system/lib/libgki.so \
	${DEVICE_PATH}/mb508/lib/libgps.so:system/lib/libgps.so \
	${DEVICE_PATH}/mb508/lib/hw/gps.sage.so:system/lib/hw/gps.ruth.so \
	${DEVICE_PATH}/mb508/lib/hw/gps.goldfish.so:system/lib/hw/gps.goldfish.so \
	${DEVICE_PATH}/mb508/bin/gkilogd:system/bin/gkilogd \
	${DEVICE_PATH}/mb508/bin/gki_pd_notifier:system/bin/gki_pd_notifier \
	${DEVICE_PATH}/mb508/bin/gkisystem:system/bin/gkisystem \
	${DEVICE_PATH}/mb508/app/FMRadio.apk:system/app/FMRadio.apk \
	${DEVICE_PATH}/mb508/app/FMRadioService.apk:system/app/FMRadioService.apk \
	${DEVICE_PATH}/mb508/etc/wifi/fw_wlan1271.bin:system/etc/wifi/fw_wlan1271.bin

#milestone
PRODUCT_COPY_FILES += \
	${DEVICE_PATH}/cyanogenmod4milestone/etc/permissions/motorola_platform.xml:system/etc/permissions/motorola_platform.xml \
	${DEVICE_PATH}/cyanogenmod4milestone/etc/permissions/required_hardware.xml:system/etc/permissions/required_hardware.xml \
	${DEVICE_PATH}/cyanogenmod4milestone/etc/apns-conf.xml:system/etc/apns-conf.xml \
#	${DEVICE_PATH}/cyanogenmod4milestone/lib/libaudio.so:obj/lib/libaudio.so \
#	${DEVICE_PATH}/cyanogenmod4milestone/lib/libaudio.so:system/lib/libaudio.so \

#XT720
PRODUCT_COPY_FILES += \
	${DEVICE_PATH}/CyanogenModXT720/etc/wifi/softap/hostapd.conf:system/etc/wifi/softap/hostapd.conf \
	${DEVICE_PATH}/CyanogenModXT720/etc/wifi/softap/tiwlan_ap.ini:system/etc/wifi/softap/tiwlan_ap.ini \
	${DEVICE_PATH}/CyanogenModXT720/etc/wifi/hostapd.conf.templet:system/etc/wifi/hostapd.conf.templet \
	${DEVICE_PATH}/CyanogenModXT720/etc/wifi/fw_tiwlan_ap.bin:system/etc/wifi/fw_tiwlan_ap.bin \
	${DEVICE_PATH}/CyanogenModXT720/etc/wifi/tiwlan_ap.ini:system/etc/wifi/tiwlan_ap.ini \
	${DEVICE_PATH}/CyanogenModXT720/lib/modules/ext4.ko:system/lib/modules/ext4.ko \
	${DEVICE_PATH}/CyanogenModXT720/lib/modules/crc16.ko:system/lib/modules/crc16.ko \
	${DEVICE_PATH}/CyanogenModXT720/lib/modules/mbcache.ko:system/lib/modules/mbcache.ko \
	${DEVICE_PATH}/CyanogenModXT720/lib/modules/cpufreq_interactive.ko:system/lib/modules/cpufreq_interactive.ko \
	${DEVICE_PATH}/CyanogenModXT720/lib/modules/cpufreq_smartass.ko:system/lib/modules/cpufreq_smartass.ko \
	${DEVICE_PATH}/CyanogenModXT720/lib/modules/symsearch.ko:system/lib/modules/symsearch.ko \
	${DEVICE_PATH}/CyanogenModXT720/lib/modules/mmcfix.ko:system/lib/modules/mmcfix.ko \
	${DEVICE_PATH}/CyanogenModXT720/lib/modules/jbd.ko:system/lib/modules/jbd.ko \
	${DEVICE_PATH}/CyanogenModXT720/lib/modules/ext3.ko:system/lib/modules/ext3.ko \
	${DEVICE_PATH}/CyanogenModXT720/lib/modules/jbd2.ko:system/lib/modules/jbd2.ko \
	${DEVICE_PATH}/CyanogenModXT720/lib/modules/thumbee.ko:system/lib/modules/thumbee.ko \
	${DEVICE_PATH}/CyanogenModXT720/lib/modules/tiap_drv.ko:system/lib/modules/tiap_drv.ko \
	${DEVICE_PATH}/CyanogenModXT720/lib/dsp/jpegenc_sn.dll64P:system/lib/dsp/jpegenc_sn.dll64P \
	${DEVICE_PATH}/CyanogenModXT720/lib/dsp/h264venc_sn.dll64P:system/lib/dsp/h264venc_sn.dll64P \
	${DEVICE_PATH}/CyanogenModXT720/lib/dsp/nbamrenc_sn.dll64P:system/lib/dsp/nbamrenc_sn.dll64P \
	${DEVICE_PATH}/CyanogenModXT720/lib/dsp/usn.dll64P:system/lib/dsp/usn.dll64P \
	${DEVICE_PATH}/CyanogenModXT720/lib/dsp/mpeg4aacdec_sn.dll64P:system/lib/dsp/mpeg4aacdec_sn.dll64P \
	${DEVICE_PATH}/CyanogenModXT720/lib/dsp/nbamrdec_sn.dll64P:system/lib/dsp/nbamrdec_sn.dll64P \
	${DEVICE_PATH}/CyanogenModXT720/lib/dsp/h264vdec_sn.dll64P:system/lib/dsp/h264vdec_sn.dll64P \
	${DEVICE_PATH}/CyanogenModXT720/lib/dsp/mpeg4aacenc_sn.dll64P:system/lib/dsp/mpeg4aacenc_sn.dll64P \
	${DEVICE_PATH}/CyanogenModXT720/lib/dsp/mp4vdec_sn.dll64P:system/lib/dsp/mp4vdec_sn.dll64P \
	${DEVICE_PATH}/CyanogenModXT720/lib/dsp/conversions.dll64P:system/lib/dsp/conversions.dll64P \
	${DEVICE_PATH}/CyanogenModXT720/lib/dsp/mp3dec_sn.dll64P:system/lib/dsp/mp3dec_sn.dll64P \
	${DEVICE_PATH}/CyanogenModXT720/lib/dsp/postprocessor_dualout.dll64P:system/lib/dsp/postprocessor_dualout.dll64P \
	${DEVICE_PATH}/CyanogenModXT720/lib/dsp/m4venc_sn.dll64P:system/lib/dsp/m4venc_sn.dll64P \
	${DEVICE_PATH}/CyanogenModXT720/lib/dsp/wbamrdec_sn.dll64P:system/lib/dsp/wbamrdec_sn.dll64P \
	${DEVICE_PATH}/CyanogenModXT720/lib/dsp/ringio.dll64P:system/lib/dsp/ringio.dll64P \
	${DEVICE_PATH}/CyanogenModXT720/lib/dsp/wbamrenc_sn.dll64P:system/lib/dsp/wbamrenc_sn.dll64P \
	${DEVICE_PATH}/CyanogenModXT720/lib/dsp/baseimage.dof:system/lib/dsp/baseimage.dof \
	${DEVICE_PATH}/CyanogenModXT720/lib/libaudio.so:system/lib/libaudio.so \
	${DEVICE_PATH}/CyanogenModXT720/lib/libaudio.so:obj/lib/libaudio.so \

# copy all of our kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell test -d device/motorola/ruth && \
	find device/motorola/ruth/modules -name '*.ko' \
	-printf '%p:system/lib/modules/%f ')

