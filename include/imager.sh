#!/bin/bash

# Script for the creation of the SDcard image

# Included script
DIR_IMAGER=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "$DIR_IMAGER/utils/utils.sh"
source "$DIR_IMAGER/utils/color.sh"
################################################################################

function create_partitions() {
    # Read arguments
    local OUTPUT=$1
    local LOOP=$2

    # Configuration
    OFFSET="1"
    BOOTSIZE="32"
    BOOTSTART=$(($OFFSET*2048))
    ROOTSTART=$(($BOOTSTART+($BOOTSIZE*2048)))
    BOOTEND=$(($ROOTSTART-1))

    # Partitions name
    local LABELBOOT="boot"
    local LABELFS="udoobuntu18_04"

    # Create image partitions (spaces and filesystems)
    echo "Creating image partitions..."
    parted -s $LOOP -- mklabel msdos
    parted -s $LOOP -- mkpart primary fat16  $BOOTSTART"s" $BOOTEND"s"
    parted -s $LOOP -- mkpart primary ext4  $ROOTSTART"s" -1"s"
    partprobe $LOOP
    mkfs.vfat -n "$LABELBOOT" $LOOP"p1" >/dev/null 2>&1
    mkfs.ext4 -q $LOOP"p2" -L "$LABELFS"

    echo_green "Partitions created in $OUTPUT!"
}

function write_bootloader() {
    # Read arguments
    local OUTPUT=$1
    local LOOP=$2

    echo "Writing U-Boot..."
    dd if="$DIR_IMAGER/../source/bootloader/SPL" of="$LOOP" bs=1k seek=1
    dd if="$DIR_IMAGER/../source/bootloader/u-boot.img" of="$LOOP" bs=1k seek=69
    echo_green "Writing U-Boot: Done!"
}

function write_kernel() {
    # Read arguments
    local OUTPUT=$1
    local LOOP=$2

    echo "Writing kernel and modules (version 3.14.56)"
    # Copy the image and the device tree (binary file)
    mkdir mnt/boot/dts
    cp $DIR_IMAGER/../source/kernel/zImage mnt/boot
    cp $DIR_IMAGER/../source/kernel/dts/*.dtb mnt/boot/dts

    # Copy the modules
    mkdir mnt/lib
    mkdir mnt/lib/modules
    cp -r $DIR_IMAGER/../source/kernel/3.14.56-02057-g5111ea94bbd mnt/lib/modules

    echo_green "Writing kerel and modules: Done!"
}
