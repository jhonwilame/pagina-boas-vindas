ECR_REGISTRY="084828595306.dkr.ecr.us-east-1.amazonaws.com"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_REGISTRY
docker build -t repo-teste .
docker tag lab:latest $ECR_REGISTRY/lab:latest
docker push $ECR_REGISTRY/lab:latest
