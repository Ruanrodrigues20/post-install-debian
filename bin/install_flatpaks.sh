#!/bin/bash

# Nome do script
APP_NAME="Flatpak Installer"
VERSION="1.0.0"

# Lista de aplicativos Flatpak a serem instalados
FLATPAK_APPS=(
    "com.spotify.Client"
    "org.gimp.GIMP"
    "com.obsproject.Studio"
    "io.mrarm.mcpelauncher"
)

# Função para verificar se o script está sendo executado como root
check_root() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "Este script deve ser executado com privilégios de superusuário (root)."
        exit 1
    fi
}

# Função para verificar se o Flatpak está instalado
check_flatpak() {
    if ! command -v flatpak &>/dev/null; then
        echo "Flatpak não está instalado. Instalando agora..."
        sudo apt update && sudo apt install -y flatpak gnome-software-plugin-flatpak
    fi
}

# Função para adicionar o Flathub como fonte de aplicativos Flatpak
add_flathub() {
    if ! flatpak remote-list | grep -q "flathub"; then
        echo "Adicionando o repositório Flathub..."
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    else
        echo "Flathub já está adicionado."
    fi
}

# Função para instalar aplicativos Flatpak
install_flatpak_apps() {
    for app in "${FLATPAK_APPS[@]}"; do
        echo "Instalando $app..."
        flatpak install -y flathub "$app"
    done
}

main(){
    # Verifica se o script está sendo executado como root
    check_root

    # Verifica se o Flatpak está instalado
    check_flatpak

    # Adiciona o repositório Flathub se necessário
    add_flathub

    # Instala os aplicativos Flatpak
    install_flatpak_apps

    echo "Instalação concluída!"    
}

main

