#!/bin/bash

# Script for the setup of the default user

# Included script
DIR_SET_USER=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "$DIR_SET_USER/utils/color.sh"
################################################################################

function set_root() {
    echo_yellow Setting root...
    # Setup the root password
    chroot mnt/ /bin/bash -c "echo root:$ROOTPWD | chpasswd"
}

function set_user() {
    echo_yellow Setting user...
    # Setup the user and user password
    chroot mnt/ /bin/bash -c "useradd -U -m -G sudo,adm,dip,plugdev,dialout $USERNAMEPWD"
    chroot mnt/ /bin/bash -c "echo $USERNAMEPWD:$USERNAMEPWD | chpasswd"
    chroot mnt/ /bin/bash -c "chsh -s /bin/bash $USERNAMEPWD"
}
