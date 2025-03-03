#!/bin/bash

# Teste para verificar a instalação de pacotes
echo "Verificando instalação de pacotes..."

sudo apt update && sudo apt install -y curl
if [ $? -ne 0 ]; then
    echo "Erro: falha na instalação do pacote curl."
    exit 1
fi

echo "Pacote curl instalado com sucesso!"
