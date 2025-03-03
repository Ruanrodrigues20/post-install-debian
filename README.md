# Post Install Debian

Bem-vindo ao **POST INSTALL DEBIAN**! Este é um script automatizado para configurar e personalizar sistemas Debian. Ele inclui funções para:

- Atualização do sistema
- Instalação de programas essenciais
- Instalação de Flatpaks
- Instalação de pacotes `.deb`
- Instalação do IntelliJ IDEA

## Pré-requisitos

Antes de executar o script, certifique-se de que você tem:

- Acesso root (sudo)
- Conexão com a internet
- Dependências essenciais instaladas (como `curl`, `wget`, `apt`, etc.)

## Estrutura do Projeto

```plaintext
.
├── bin
│   ├── install_flatpaks.sh       # Script para instalar Flatpaks
│   ├── install_intellij.sh       # Script para instalar o IntelliJ IDEA
│   ├── install_programs_debs.sh  # Script para instalar pacotes .deb
│   ├── install_programs.sh       # Script para instalar programas essenciais
│   └── system_update.sh          # Script para atualizar o sistema
├── config
│   └── settings.conf             # Arquivo de configurações
├── lib
│   └── utils.sh                 # Funções utilitárias
├── logs
│   └── meu-script.log           # Log de execução do script
├── LICENSE.txt                  # Arquivo de licença
├── README.md                    # Este arquivo
└── install.sh                   # Script de instalacao
```

## Como Usar

1. Clone o repositório:
   ```bash
   git clone git@github.com:Ruanrodrigues20/post-install-debian.git
   cd post-install-debian
   ```

2. Torne o script `install.sh` executável:
   ```bash
   chmod +x install.sh
   ```

3. Execute o script:
   ```bash
   sudo ./install.sh
   ```

Isso irá iniciar a configuração do seu sistema com as etapas descritas acima.

## Configurações

As configurações do projeto são armazenadas no arquivo `config/settings.conf`. Edite este arquivo para personalizar o comportamento do script, como os diretórios de download e a versão do IntelliJ IDEA a ser instalada.

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE.txt).

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests para melhorar o projeto.

```