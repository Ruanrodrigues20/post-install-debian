#!/bin/bash

up() {
    sudo apt update && sudo apt upgrade -y
    sudo apt full-upgrade -y
}

remove_lock() {
    sudo pkill -9 apt
    sudo pkill -9 dpkg

    sudo rm -rf /var/lib/dpkg/lock* 
    sudo rm -rf /var/lib/apt/lists/lock
    sudo dpkg --configure -a
    sudo apt autoclean -y
}


fix_bluteoth(){
    sudo apt install -y firmware-iwlwifi 

    # Cria o diretório de firmware da Intel, se não existir
    sudo mkdir -p /lib/firmware/intel
    cd /lib/firmware/intel || exit 1

    # Baixa os arquivos de firmware da Intel
    sudo wget -O ibt-0040-2120.sfi "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/intel/ibt-0040-2120.sfi"
    sudo wget -O ibt-0040-2120.ddc "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/intel/ibt-0040-2120.ddc"

    # Reinicia o módulo Bluetooth
    sudo modprobe -r btusb
    sudo modprobe btusb

    # Reinicia o serviço Bluetooth
    sudo systemctl restart bluetooth

    # Opcional: Desativa e depois ativa o serviço Bluetooth
    sudo systemctl disable bluetooth
    sudo systemctl start bluetooth

}

remove_lock
up
fix_bluteoth