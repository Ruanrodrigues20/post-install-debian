#!/bin/bash

# Atualiza o sistema
up() {
    echo -e "\033[34m1. Updating System.\033[0m"
    echo ""
    sudo apt update && sudo apt upgrade -y
}

# Remove travas do APT
remove_lock() {
    echo "Verificando travas do APT..."

    # Encerra todos os processos apt ou dpkg em execução
    echo "Matando processos apt/dpkg em execução..."
    sudo pkill -9 apt
    sudo pkill -9 dpkg

    # Remove locks e corrige pacotes quebrados
    echo "Removendo locks do APT..."
    sudo rm -rf /var/lib/dpkg/lock* 
    sudo rm -rf /var/lib/apt/lists/lock
    sudo dpkg --configure -a
    sudo apt autoclean -y
    echo "Locks removidos com sucesso!"
}

# Chamada das funções
remove_lock
up
