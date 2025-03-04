#!/bin/bash


if [ -z "$1" ]; then
    LATEST_VERSION="2024.3.2.2"  # Versão padrão
else
    LATEST_VERSION="$1" 
fi

echo "Installing IntelliJ IDEA version: ${LATEST_VERSION}"


BASE_URL="https://download-cdn.jetbrains.com/idea/"


DOWNLOAD_URL="${BASE_URL}ideaIU-${LATEST_VERSION}.tar.gz"
echo "Downloading IntelliJ IDEA version ${LATEST_VERSION}..."

curl -L -O "$DOWNLOAD_URL" 

if [ ! -f "ideaIU-${LATEST_VERSION}.tar.gz" ]; then
    echo "Error: Download failed. Check your connection or the link."    exit 1
fi

tar -xvzf "ideaIU-${LATEST_VERSION}.tar.gz"

mv idea-* idea

sudo mv idea /opt/intellij-idea

sudo ln -s /opt/intellij-idea/bin/idea.sh /usr/local/bin/idea

sudo chmod +x /usr/local/bin/idea

sudo bash -c 'cat > /usr/share/applications/intellij-idea.desktop <<EOF
[Desktop Entry]
Name=IntelliJ IDEA
Comment=Edição Comunitária do IntelliJ IDEA
Exec=/opt/intellij-idea/bin/idea.sh %f
Icon=/opt/intellij-idea/bin/idea.png
Terminal=false
Type=Application
Categories=Desenvolvimento;IDE;
StartupWMClass=jetbrains-idea
EOF'

sudo update-desktop-database

rm "ideaIU-${LATEST_VERSION}.tar.gz"

echo "Installation complete! You can start IntelliJ IDEA with the 'idea' command or from the application menu."