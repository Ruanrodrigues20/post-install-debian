#!/bin/bash

# Executa todos os testes
echo "Executando todos os testes..."

./tests/test_dependencies.sh
./tests/test_installation.sh
./tests/test_permissions.sh
./tests/test_connectivity.sh
./tests/test_lock_removal.sh
./tests/test_download.sh
./tests/test_post_install.sh
./tests/test_performance.sh

echo "Todos os testes foram concluídos!"
