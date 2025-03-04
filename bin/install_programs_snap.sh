#!/bin/bash

# Script Name
APP_NAME="Program Installer Snaps"
VERSION="1.0.0"

# List of packages to be installed
PACKAGES=(
    "notion-snap-reborn"
    "snap-store"
)

# Function to check if the script is running as root
check_root() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "This script must be run with superuser privileges (root)."
        exit 1
    fi
}

# Function to update the package list and install packages
install_packages() {    
    for package in "${PACKAGES[@]}"; do
        echo "Installing $package..."
        sudo snap install "$package"
    done

    echo "Installation completed."
}

main(){
    # Check if the script is running as root
    check_root

    # Install packages
    install_packages
}

main
