#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

FDEVICE="malta_64"

fox_get_target_device() {
    local chkdev=$(echo "$BASH_SOURCE" | grep "$FDEVICE")
    if [ -n "$chkdev" ]; then
        FOX_BUILD_DEVICE="$FDEVICE"
    else
        chkdev=$(set | grep BASH_ARGV | grep "$FDEVICE")
        [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
    fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
    fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    export TW_DEFAULT_LANGUAGE="en"
    export LC_ALL="C"
    export ALLOW_MISSING_DEPENDENCIES=true
    export FOX_BUILD_DEVICE="$FDEVICE"
    export FOX_AB_DEVICE=1
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1

    # Malta is a 720x1600 20:9 display with a waterdrop cutout.
    export OF_SCREEN_H="2400"
    export OF_STATUS_H="96"
    export OF_STATUS_INDENT_LEFT="20"
    export OF_STATUS_INDENT_RIGHT="20"
    export OF_HIDE_NOTCH="1"
    export OF_ALLOW_DISABLE_NAVBAR="0"

    export OF_USE_MAGISKBOOT=1
    export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
    export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
    export OF_FBE_METADATA_MOUNT_IGNORE=1
    export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
    export OF_PATCH_AVB20=1
    export OF_QUICK_BACKUP_LIST="/boot;/data;"
    export OF_MAINTAINER="vishwajithkv"
fi
