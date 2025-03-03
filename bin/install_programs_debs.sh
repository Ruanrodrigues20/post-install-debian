#!/bin/bash
# Nome do script
APP_NAME="Deb Packages Installer"
VERSION="1.0.0"


CONFIG_FILE="./config/settings.conf"
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "Erro: $CONFIG_FILE não encontrado!"
    exit 1
fi



# Lista de pacotes .deb com URL
DEB_PACKAGES=(
    "https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb"
    "https://stable.dl2.discordapp.net/apps/linux/0.0.87/discord-0.0.87.deb"
    "https://vscode.download.prss.microsoft.com/dbazure/download/stable/e54c774e0add60467559eb0d1e229c6452cf8447/code_1.97.2-1739406807_amd64.deb"
)


# Função para verificar se o script está sendo executado como root
check_root() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "Este script deve ser executado com privilégios de superusuário (root)."
        exit 1
    fi
}

create_download_dir() {
    if [ ! -d "$DOWNLOAD_DIR" ]; then
        echo "Criando diretório de downloads: $DOWNLOAD_DIR"
        mkdir -p "$DOWNLOAD_DIR"
    fi
}

# Função para baixar pacotes .deb
download_debs() {
    echo ""
    echo -e "\e[34m4. Downloading .deb packages.\e[0m"
    echo ""

    mkdir -p "$DOWNLOAD_DIR"

    for url in "${DEB_PACKAGES[@]}"; do
        file_name=$(basename "$url")
        echo "Baixando: $file_name"
        wget -c "$url" -P "$DOWNLOAD_DIR"
    done
}

# Função para instalar os pacotes .deb
install_debs() {
    echo ""
    echo -e "\e[34m5. Installing .deb packages.\e[0m"
    echo ""

    for file in "$DOWNLOAD_DIR"/*.deb; do
        echo "Instalando: $(basename "$file")"
        sudo dpkg -i "$file" || sudo apt install -f -y
    done
}

garbage() {
    if [ -d "$DOWNLOAD_DIR" ]; then
        echo "Removendo arquivos .deb em $DOWNLOAD_DIR..."
        sudo rm -rf "$DOWNLOAD_DIR"/*.deb
        echo "Arquivos .deb removidos com sucesso!"
    else
        echo "Diretório $DOWNLOAD_DIR não encontrado. Nada para limpar."
    fi
}

main(){

    # Verifica se o script está sendo executado como root
    check_root

    #Verifica o dir de download temporario
    create_download_dir

    # Baixa os pacotes
    download_debs

    install_debs
        
    # Remover lixo
    garbage
    
    # Instala os pacotes
    echo "Instalação concluída!"
}

main