#!/bin/bash

# Script fot update and install the packages and programs

# Included script
DIR_PACKAGES=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "$DIR_PACKAGES/utils/color.sh"
source "$DIR_PACKAGES/include/resize.sh"
################################################################################

function add_source_list() {
    echo_yellow "Adding source list"
    # cp $DIR_PACKAGES/../configure/packages.txt mnt/etc/apt/sources.list
    install -m 644 $DIR_PACKAGES/../configure/sources.list "mnt/etc/apt/sources.list"
}

function install_packages() {
    # Update
    echo_yellow Installing update...
    chroot mnt/ /bin/bash -c "apt update -y"
    chroot mnt/ /bin/bash -c "apt upgrade -y"

    # # Packages list
    local BASE_PACKAGES=( openssh-server alsa-utils bash-completion policykit-1
      bluez blueman curl dosfstools fbset iw nano module-init-tools ntp unzip usbutils
      vlan wireless-tools wget wpasupplicant unicode-data console-data console-common
      pv sysfsutils cpufrequtils ntfs-3g locate command-not-found man-db git i2c-tools
      python-pip vim minicom crda manpages systemd-services systemd-shim wireless-regdb
      udoo-gpio-export net-tools)
    #UDOO related
    local BASE_PACKAGES+=( firmware-imx-9t fsl-alsa-plugins-9t imx-lib-9t imx-udev-fsl-rules
      imx-vpu-9t libfslcodec-9t libfslparser-9t libfslvpuwrap-9t hostapd dtweb )
    #dev library
    local BASE_PACKAGES+=( python-serial librxtx-java )


    echo_yellow Installing packages...
    for package in "${BASE_PACKAGES[@]}"
    do :
        chroot mnt/ /bin/bash -c "apt-get install $package -y"
    done

}
