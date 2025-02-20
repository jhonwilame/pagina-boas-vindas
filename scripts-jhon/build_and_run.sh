#!/bin/bash

# Nome da imagem
IMAGE_NAME="minha-img-container"

# Nome do container
CONTAINER_NAME="minha-pagina"

# Constrói a imagem
docker build -t "$IMAGE_NAME" -f Dockerfile .

# Verifica se a construção da imagem foi bem-sucedida
if [[ $? -eq 0 ]]; then
  echo "Imagem $IMAGE_NAME construída com sucesso!"

  # Executa o container em segundo plano (detached mode) e mapeia a porta 80
  docker run --name "$CONTAINER_NAME" -d -p 80:80 "$IMAGE_NAME"

  # Verifica se o container foi iniciado com sucesso
  if [[ $? -eq 0 ]]; then
    echo "Container $CONTAINER_NAME em execução!"

    # Lista os containers em execução (opcional)
    docker ps
  else
    echo "Erro ao iniciar o container $CONTAINER_NAME."
  fi
else
  echo "Erro ao construir a imagem $IMAGE_NAME."
fi
