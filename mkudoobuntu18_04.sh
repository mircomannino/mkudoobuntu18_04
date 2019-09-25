#!/bin/bash

# Script for the realization of the SDcard image and its configuration

# Included files
DIR_MKUDOOBUNTU=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "$DIR_MKUDOOBUNTU/include/imager.sh"
source "$DIR_MKUDOOBUNTU/include/utils/color.sh"
source "$DIR_MKUDOOBUNTU/include/set_user_and_root.sh"
source "$DIR_MKUDOOBUNTU/include/packages.sh"
source "$DIR_MKUDOOBUNTU/include/utils/color.sh"
source "$DIR_MKUDOOBUNTU/configure/udoo_neo.sh"
################################################################################


# The first stage is the function that do the initial operation such as:
# creating partitions, upload the bootloader, ...
# Many of its operation are taken from ../include/imager.sh
function first_stage() {
    # Read arguments
    local OUTPUT=$1
    local LOOP=$2

    echo_yellow "Starting setup"

    # Create the empty image file
    echo "Creating a 700 MB image in $OUTPUT..."
    dd if=/dev/zero of=$OUTPUT bs=1M count=700 status=noxfer >/dev/null 2>&1  # --> Da decommentare
    echo_green "Image created!"
    # Associate loop-device with .img file
    losetup $LOOP $OUTPUT || echo_red "Cannot set $LOOP"

    # Create the partitions - from include/imager.sh
    create_partitions $OUTPUT $LOOP
    # Copy the bootloader - from include/imager.sh
    write_bootloader $OUTPUT $LOOP

    # Mount udoobuntu18_04
    mkdir mnt 2> /dev/null
    mount "${LOOP}p2" mnt/
    # Mount boot
    mkdir mnt/boot 2> /dev/null
    mount "${LOOP}p1" mnt/boot/

    # Copy the kernel - from include/imager.sh
    write_kernel $OUTPUT $LOOP

    echo_green "Setup complete!"

    # Debootstrap - first_stage
    echo "Starting debootstrap - first stage..."
    debootstrap --foreign --arch=armhf --verbose bionic mnt/
    echo_green "debootstrap - first_stage: Done!"

}


# The second stage is the function that give the final configuration to
# the image file. An important operation is the debootstrap operaion executed
# in chroot.
function second_stage() {
    echo_yellow "Starting second-stage"

    # Copy the qemu file
    cp $DIR_MKUDOOBUNTU/source/qemu-arm/qemu-arm-static mnt/usr/bin

    # Change root and run the second stage
    chroot mnt/ /bin/bash -c "/debootstrap/debootstrap --second-stage"

    echo_green "Debootstrap second-stage completed!"
}

# This function configure the system: adding the default user, set the root
# password, install the packages...
function configuration() {
    echo_yellow "Starting configuration..."
    # Edit the hostname file
    chroot mnt/ /bin/bash -c "echo \"$HOSTNAME\" > /etc/hostname"


    # Setup the user and root - from include/set_user_and_root.sh
    set_root
    set_user

    # Install packages - from include/packages.sh
    add_source_list
    install_packages

    echo_green "Configuration complete!"
}


function final_operations() {
    # Read arguments
    local LOOP=$1

    umount -lf mnt/boot
    umount -lf mnt
    rm -rf mnt
    losetup -d "$LOOP"
    sync
}

################################################################################
function main() {
    # Configuration
    local OUTPUT="udoobuntu-udoo_neo-18.04_$(date +%Y%m%d-%H%M).img"
    local LOOP=$(losetup -f)

    echo_yellow "Starting build..."

    first_stage $OUTPUT $LOOP
    second_stage $OUTPUT $LOOP
    configuration
    final_operations $LOOP

    echo_green "Build complete!"
}

main $@
