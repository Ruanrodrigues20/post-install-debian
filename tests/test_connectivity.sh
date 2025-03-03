#!/bin/bash

# Teste para verificar conectividade
echo "Verificando conectividade com a internet..."

curl -fsSL https://raw.githubusercontent.com/Ruanrodrigues20/intelliJ-install/main/install.sh >/dev/null || { echo "Erro: falha na conexão para baixar o script."; exit 1; }

echo "Conexão com a internet verificada com sucesso!"
