ECR_REGISTRY="SEU_REGISTRY"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_REGISTRY
docker build -t repo-teste .
docker tag repo-teste:latest $ECR_REGISTRY/repo-teste:latest
docker push $ECR_REGISTRY/repo-teste:latest
