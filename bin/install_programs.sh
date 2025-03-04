#!/bin/bash

# Script Name
APP_NAME="Program Installer"
VERSION="1.0.0"

# List of packages to be installed
PACKAGES=(
    "curl"
    "git"
    "vim"
    "build-essential"
    "vlc"
    "python3-pip"
    "gnome-tweaks"
    "gnome-shell-extension-manager"
    "maven"
    "flatpak"
    "tree"
    "dpkg"
    "wget"
    "gnome-software-plugin-flatpak"
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
    echo "Updating package list..."
    sudo apt update
    
    for package in "${PACKAGES[@]}"; do
        echo "Installing $package..."
        sudo apt install -y "$package"
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
