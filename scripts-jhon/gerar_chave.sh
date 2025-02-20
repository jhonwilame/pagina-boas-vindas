#!/bin/bash

# Instala o Git
sudo apt-get update
sudo apt-get upgrade 
sudo apt-get install git -y

# Gera a chave SSH
ssh-keygen -t rsa -b 4096 -C "wiamejhon@gmail.com" # Substitua pelo seu email

# Exibe a chave pública com a mensagem destacada em amarelo
echo -e "\e[33mCopie a chave SSH abaixo e cole em 'Add new SSH Key' do seu GitHub:\e[0m"
cat ~/.ssh/id_rsa.pub

