#!/bin/bash

# Script Name
APP_NAME="Program Installer"
VERSION="1.0.0"

# List of packages to be installed
PACKAGES=(
    "wget"
    "curl"
    "git"
    "vim"
    "build-essential"
    "bash-complemetion"
    "vlc"
    "python3-pip"
    "gnome-tweaks"
    "gnome-shell-extension-manager"
    "maven"
    "python3-poetry"
    "flatpak"
    "tree"
    "dpkg"
    "gnome-software-plugin-flatpak"
    "snap"
    "snapd"
)

PACKAGES_GARBAGE=(
	"firefox-esr"
    "gnome-2048"
    "gnome-chess"
    "gnome-sushi"
    "gnome-sudoku"
    "gnome-tetravex"
    "gnome-mines"
    "five-or-more"
    "kasumi"
    "four-in-a-row"
    "goldendict"
    "hitori"
    "libreoffice-core" 
    "libreoffice-common"
    "lightsoff"
    "gnome-mines"
    "xterm"
    "mlterm"
    "gnome-nibbles"
    "gnome-robots"
    "swell-foop"
	"tali"
	"gnome-taquin"
	"gnome-tetravex"
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
        sudo apt install -y "$package"
    done

    echo "Installation completed."
}

install_firefox(){
	sudo install -d -m 0755 /etc/apt/keyrings
	wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
	gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nO fingerprint da chave corresponde ("$0").\n"; else print "\nFalha na verificação: o fingerprint ("$0") não corresponde ao esperado.\n"}'
	echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
	echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla 
	sudo apt-get update && sudo apt-get install firefox
}

remove_packages(){
    for package in "${PACKAGES_GARBAGE[@]}"; do
        sudo apt install -y "$package"
    done
}

main(){
    # Check if the script is running as root
    check_root
    # Install packages
    install_packages
    install_firefox
    remove_packages
}

main
