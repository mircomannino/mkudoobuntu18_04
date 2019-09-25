#!/bin/bash

# Script for the color of the characters

# RED
function echo_red() {
    local red="\e[91m"
    local rst="\e[0m"
    echo -e "$red$@ $rst"
}

# GREEN
function echo_green() {
    local green="\e[92m"
    local rst="\e[0m"
    echo -e "$green$@ $rst"
}

# YELLOW
function echo_yellow() {
    local yellow="\e[93m"
    local rst="\e[0m"
    echo -e "$yellow$@ $rst"
}

# BLUE
function echo_blue() {
    local blue="\e[94m"
    local rst="\e[0m"
    echo -e "$blue$@ $rst"
}
