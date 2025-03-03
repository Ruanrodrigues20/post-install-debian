#!/bin/bash

# Teste para verificar o download de pacotes
echo "Verificando download de pacotes..."

DOWNLOAD_DIR="./temp"
mkdir -p $DOWNLOAD_DIR

wget -c https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb -P $DOWNLOAD_DIR
if [ $? -ne 0 ]; then
    echo "Erro: falha ao baixar o pacote JDK."
    exit 1
fi

echo "Pacote JDK baixado com sucesso!"
