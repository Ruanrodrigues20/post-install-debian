#!/bin/bash
# Script name
APP_NAME="Deb Packages Installer"
VERSION="1.0.0"


CONFIG_FILE="./config/settings.conf"
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "Error: $CONFIG_FILE not found!"
    exit 1
fi



# List of .deb packages with URL
DEB_PACKAGES=(
    "https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb"
    "https://stable.dl2.discordapp.net/apps/linux/0.0.87/discord-0.0.87.deb"
    "https://vscode.download.prss.microsoft.com/dbazure/download/stable/e54c774e0add60467559eb0d1e229c6452cf8447/code_1.97.2-1739406807_amd64.deb"
)


# Function to check if the script is running as root
check_root() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "This script must be run with superuser (root) privileges."
        exit 1
    fi
}

create_download_dir() {
    if [ ! -d "$DOWNLOAD_DIR" ]; then
    echo "Creating downloads directory: $DOWNLOAD_DIR"        mkdir -p "$DOWNLOAD_DIR"
    fi
}

# Function to download .deb packages
download_debs() {

    mkdir -p "$DOWNLOAD_DIR"

    for url in "${DEB_PACKAGES[@]}"; do
        file_name=$(basename "$url")
        echo "Downloading: $file_name"
        wget -c "$url" -P "$DOWNLOAD_DIR"
    done
}

# Function to install .deb packages
install_debs() {
    for file in "$DOWNLOAD_DIR"/*.deb; do
        echo "Installing: $(basename "$file")"
        sudo dpkg -i "$file" || sudo apt install -f -y
    done
}

garbage() {
    if [ -d "$DOWNLOAD_DIR" ]; then
        sudo rm -rf "$DOWNLOAD_DIR"/*.deb
    fi
}

main(){
    check_root
    create_download_dir
    download_debs
    install_debs
    garbage
}

main