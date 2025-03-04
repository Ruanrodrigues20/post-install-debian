#!/bin/bash

up() {
    sudo apt update && sudo apt upgrade -y
}

remove_lock() {
    sudo pkill -9 apt
    sudo pkill -9 dpkg

    sudo rm -rf /var/lib/dpkg/lock* 
    sudo rm -rf /var/lib/apt/lists/lock
    sudo dpkg --configure -a
    sudo apt autoclean -y
}

remove_lock
up
