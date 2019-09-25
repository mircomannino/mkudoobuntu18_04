#!/bin/bash

# A list of usefull functions

# CHECKROOT
# Check if a command is executed with root privileges
function checkroot() {
  if [ $(id -u) -ne 0 ]
  then
    echo "You're not root! Try execute: sudo $0"
  fi
}
