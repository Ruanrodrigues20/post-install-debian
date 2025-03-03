#!/bin/bash

# Teste para verificar instalação pós-download
echo "Verificando instalação pós-download..."

sudo dpkg -i ./temp/jdk-21_linux-x64_bin.deb
if [ $? -ne 0 ]; then
    echo "Erro: falha ao instalar o pacote JDK."
    exit 1
fi

echo "Pacote JDK instalado com sucesso!"
