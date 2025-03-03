#!/bin/bash

# Função para log de informações
log_info() {
    local msg="$1"
    local log_file="$2"
    echo "[INFO] $(date +"%Y-%m-%d %H:%M:%S") - $msg"
    echo "[INFO] $(date +"%Y-%m-%d %H:%M:%S") - $msg" >> "$log_file"
}

# Função para log de erros
log_error() {
    local msg="$1"
    local log_file="$2"
    echo "[ERROR] $(date +"%Y-%m-%d %H:%M:%S") - $msg" >&2
    echo "[ERROR] $(date +"%Y-%m-%d %H:%M:%S") - $msg" >> "$log_file"
}
