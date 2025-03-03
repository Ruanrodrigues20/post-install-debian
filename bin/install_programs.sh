#!/bin/bash

# Nome do script
APP_NAME="program installer"
VERSION="1.0.0"

# Lista de pacotes a serem instalados
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

# Função para verificar se o script está sendo executado como root
check_root() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "Este script deve ser executado com privilégios de superusuário (root)."
        exit 1
    fi
}

# Função para atualizar a lista de pacotes e instalar os pacotes
install_packages() {
    echo "Atualizando a lista de pacotes..."
    sudo apt update
    
    for package in "${PACKAGES[@]}"; do
        echo "Instalando $package..."
        sudo apt install -y "$package"
    done

    echo "Instalação concluída."
}

main(){
    # Verifica se o script está sendo executado como root
    check_root

    # Instalar pacotes
    install_packages

    echo "Tudo pronto!"

}

main
