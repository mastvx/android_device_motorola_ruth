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
	${DEVICE_PREBUILT}/bin/mot_boot_mode:system/bin/mot_boot_mode \
	${DEVICE_PREBUILT}/bin/fixDelSystem.sh:system/bin/fixDelSystem.sh \
	${DEVICE_PREBUILT}/bin/install2ndInit.sh:system/bin/install2ndInit.sh \
	${DEVICE_PREBUILT}/etc/wifi/tiwlan.ini:etc/wifi/tiwlan.ini \
	${DEVICE_PREBUILT}/etc/init.d/20userinit:etc/init.d/20userinit \
	${DEVICE_PREBUILT}/etc/cameraCalFileDef5M.bin:system/etc/cameraCalFileDef5M.bin \
	${DEVICE_PATH}/mb508/lib/libcamera.so:obj/lib/libcamera.so \
	${DEVICE_PATH}/mb508/lib/libcamera.so:system/lib/libcamera.so \
	${DEVICE_PATH}/mb508/lib/libgki.so:system/lib/libgki.so \
	${DEVICE_PATH}/mb508/bin/gkilogd:system/bin/gkilogd \
	${DEVICE_PATH}/mb508/bin/gki_pd_notifier:system/bin/gki_pd_notifier \
	${DEVICE_PATH}/mb508/bin/gkisystem:system/bin/gkisystem \
	${DEVICE_PATH}/mb508/etc/wifi/fw_wlan1271.bin:system/etc/wifi/fw_wlan1271.bin

# copy all of our kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell test -d device/motorola/ruth && \
	find device/motorola/ruth/modules -name '*.ko' \
	-printf '%p:system/lib/modules/%f ')

