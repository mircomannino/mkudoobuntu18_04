#!/bin/bash

# Script fot update and install the packages and programs

# Included script
DIR_PACKAGES=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "$DIR_PACKAGES/utils/color.sh"
################################################################################

function add_source_list() {
    echo_yellow "Adding source list"
    cp $DIR_PACKAGES/../configure/packages.txt mnt/etc/apt/sources.list
}

function install_packages() {
    # Update
    echo_yellow Installing update...
    chroot mnt/ /bin/bash -c "apt-get update -y"
    chroot mnt/ /bin/bash -c "apt-get upgrade -y"

    # Install
    echo_yellow Installing packages...
    chroot mnt/ /bin/bash -c "apt-get install net-tools -y"
    chroot mnt/ /bin/bash -c "apt-get install i2c-tools -y"
    chroot mnt/ /bin/bash -c "apt-get install man-db -y"


}
