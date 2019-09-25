#!/bin/bash

# Script for the color test

# Including the script to be tested
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source "$DIR/../color.sh"
################################################################################

# Test the function
function test_color() {
    echo "Testing color..."
    # red-test
    local RED_STR="red line"
    echo_red $RED_STR
    # green-test
    local GREEN_STR="green line"
    echo_green $GREEN_STR
    # yellow-test
    local YELLOW_STR="yellow line"
    echo_yellow $YELLOW_STR
    # blue-test
    local BLUE_STR="blue line"
    echo_blue $BLUE_STR
}

test_color
