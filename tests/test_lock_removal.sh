#!/bin/bash

# Teste para verificar remoção de locks
echo "Verificando remoção de locks..."

remove_lock() {
    if pgrep -x "apt" >/dev/null || pgrep -x "dpkg" >/dev/null; then
        exit 1
    else
        sudo rm -rf /var/lib/dpkg/lock*
        sudo rm -rf /var/lib/apt/lists/lock
        sudo dpkg --configure -a
        sudo apt autoclean -y
    fi
}

remove_lock
if [ $? -ne 0 ]; then
    echo "Erro: falha ao remover lock de pacotes."
    exit 1
fi

echo "Locks removidos com sucesso!"
