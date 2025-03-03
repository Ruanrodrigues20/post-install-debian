#!/bin/bash

# Verifica se SCRIPT_DIR está configurado corretamente
SCRIPT_DIR="$(dirname "$0")"

# Carrega funções utilitárias
UTILS_FILE="$SCRIPT_DIR/lib/utils.sh"
if [ -f "$UTILS_FILE" ]; then
    source "$UTILS_FILE"
else
    echo "Erro: Arquivo de funções $UTILS_FILE não encontrado!"
    exit 1
fi

# Carrega configurações
CONFIG_FILE="$SCRIPT_DIR/config/settings.conf"
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "Erro: Arquivo de configuração $CONFIG_FILE não encontrado!"
    exit 1
fi

# Define arquivo de log
LOG_FILE="$SCRIPT_DIR/logs/script.log"

# Função principal
main() {
    chmod +x bin/*

    # Log de início
    log_info "Iniciando o projeto: $APP_NAME (v$VERSION)" "$LOG_FILE"
    echo "Bem-vindo ao $APP_NAME!"

    # Executa o script de atualização do sistema
    if [ -f "$SCRIPT_DIR/bin/system_update.sh" ]; then
        echo "Executando atualização do sistema..."
        bash "$SCRIPT_DIR/bin/system_update.sh"
    else
        echo "Erro: system_update.sh não encontrado!"
        exit 1
    fi

    # Executa o script de instalação de programas
    if [ -f "$SCRIPT_DIR/bin/install_programs.sh" ]; then
        echo "Instalando programas..."
        bash "$SCRIPT_DIR/bin/install_programs.sh"
    else
        echo "Erro: install_programs.sh não encontrado!"
        exit 1
    fi

    # Executa o script de instalação de Flatpaks
    if [ -f "$SCRIPT_DIR/bin/install_flatpaks.sh" ]; then
        echo "Instalando Flatpaks..."
        bash "$SCRIPT_DIR/bin/install_flatpaks.sh"
    else
        echo "Erro: install_flatpaks.sh não encontrado!"
        exit 1
    fi

    # Executa o script de instalação de pacotes .deb
    if [ -f "$SCRIPT_DIR/bin/install_programs_debs.sh" ]; then
        echo "Instalando pacotes .deb..."
        bash "$SCRIPT_DIR/bin/install_programs_debs.sh"
    else
        echo "Erro: install_programs_debs.sh não encontrado!"
        exit 1
    fi
}

# Executa a função principal
main
