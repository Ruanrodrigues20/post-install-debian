#!/bin/bash

# Teste para verificar dependências
echo "Verificando dependências..."

command -v wget >/dev/null 2>&1 || { echo "Erro: wget não está instalado."; exit 1; }
command -v curl >/dev/null 2>&1 || { echo "Erro: curl não está instalado."; exit 1; }

echo "Dependências verificadas com sucesso!"
