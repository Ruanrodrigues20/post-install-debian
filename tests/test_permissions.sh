#!/bin/bash

# Teste para verificar permissões
echo "Verificando permissões..."

if [ "$(id -u)" -ne 0 ]; then
    echo "Erro: este script precisa ser executado como root."
    exit 1
fi

echo "Permissões verificadas com sucesso!"
