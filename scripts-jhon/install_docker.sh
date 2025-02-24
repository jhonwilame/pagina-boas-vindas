#!/bin/bash

# Atualiza o sistema
sudo apt update
sudo apt upgrade -y

# Instala pacotes de pré-requisitos
sudo apt-get install -y curl apt-transport-https ca-certificates software-properties-common

# Adiciona os repositórios do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualiza informações do repositório
sudo apt update

# Instala o Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Verifica status do Docker
sudo systemctl status docker

# Adiciona o usuário atual ao grupo docker (opcional, mas recomendado)
sudo usermod -aG docker $USER

echo "Instalação do Docker concluída. Reinicie o sistema ou execute 'newgrp docker' para aplicar as alterações de grupo."
