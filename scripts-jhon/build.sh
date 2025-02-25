#!/bin/bash

ECR_REGISTRY="084828595306.dkr.ecr.us-east-1.amazonaws.com"
IMAGE_NAME="repo-teste"  # Use o mesmo nome que você deu na hora do build

# Remova a linha do docker login

docker build -t $IMAGE_NAME .
docker tag $IMAGE_NAME:latest "$ECR_REGISTRY/$IMAGE_NAME:latest"

docker push "$ECR_REGISTRY/$IMAGE_NAME:latest"

echo "Build e push concluídos."
