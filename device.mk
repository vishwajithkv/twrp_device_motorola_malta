#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/motorola/malta_64

# Recovery crypto and dynamic-partition support
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true

# Malta uses Android 10 FBE with the Microtrust/Beanpod Keymaster 4.0
# implementation. These OrangeFox fallbacks are required on MTK devices
# when the ROM fstab cannot be processed from recovery.
OF_FBE_METADATA_MOUNT_IGNORE := 1
OF_FORCE_USE_RECOVERY_FSTAB := 1
OF_DEFAULT_KEYMASTER_VERSION := 4.0
OF_FIX_DECRYPTION_ON_DATA_MEDIA := 1

# The recovery kernel does not expose the normal Android battery service.
OF_USE_LEGACY_BATTERY_SERVICES := 1
# MTK power-supply reports capacity asynchronously during recovery startup.
TW_BATTERY_SYSFS_WAIT_SECONDS := 20
BOARD_USES_METADATA_PARTITION := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true
TARGET_USES_MKE2FS := true
TW_NO_SCREEN_BLANK := true
TW_STATUS_ICONS_ALIGN := center

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload
