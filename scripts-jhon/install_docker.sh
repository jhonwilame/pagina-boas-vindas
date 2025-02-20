#!/bin/bash

# Atualiza os pacotes do sistema
sudo apt update

# Instala os pacotes necessários para o Docker
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Adiciona a chave GPG do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Adiciona o repositório do Docker
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualiza a lista de pacotes novamente
sudo apt update

# Instala o Docker Engine, Containerd e Docker Compose
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Adiciona seu usuário ao grupo docker
sudo usermod -aG docker $USER

# Reinicia o serviço Docker para aplicar as alterações
sudo systemctl restart docker

# Verifica se o Docker está em execução usando um método mais robusto
if command -v docker &> /dev/null; then
  if docker info &> /dev/null; then
    echo -e " \e[1;34m Docker instalado com sucesso!\e[0m"
  else
    echo -e "\e[1;31mErro: O daemon Docker não está em execução.\e[0m"
    exit 1
  fi
else
  echo -e "\e[1;31mErro: Docker não instalado.\e[0m"
  exit 1
fi

# Mensagem informativa sobre reiniciar o sistema (apenas se a instalação do docker foi bem-sucedida)
echo "Reinicie seu sistema ou faça logout para aplicar as alterações de grupo."

# Limpeza do cache apt (Opcional)
sudo apt autoremove -y
sudo apt clean -y
