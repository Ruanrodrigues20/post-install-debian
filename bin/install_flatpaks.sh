#!/bin/bash

# Script Name
APP_NAME="Flatpak Installer"
VERSION="1.0.0"

# List of Flatpak applications to be installed
FLATPAK_APPS=(
    "com.spotify.Client"
    "org.gimp.GIMP"
    "com.obsproject.Studio"
    "io.mrarm.mcpelauncher"
)

# Function to check if the script is running as root
check_root() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "This script must be run with superuser privileges (root)."
        exit 1
    fi
}

# Function to check if Flatpak is installed
check_flatpak() {
    if ! command -v flatpak &>/dev/null; then
        echo "Flatpak is not installed. Installing now..."
        sudo apt update && sudo apt install -y flatpak gnome-software-plugin-flatpak
    fi
}

# Function to add Flathub as a Flatpak source
add_flathub() {
    if ! flatpak remote-list | grep -q "flathub"; then
        echo "Adding Flathub repository..."
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    else
        echo "Flathub is already added."
    fi
}

# Function to install Flatpak applications
install_flatpak_apps() {
    for app in "${FLATPAK_APPS[@]}"; do
        echo "Installing $app..."
        flatpak install -y flathub "$app"
    done
}

main(){
    # Check if the script is running as root
    check_root

    # Check if Flatpak is installed
    check_flatpak

    # Add Flathub repository if necessary
    add_flathub

    # Install Flatpak applications
    install_flatpak_apps

    echo "Installation completed!"    
}

main
