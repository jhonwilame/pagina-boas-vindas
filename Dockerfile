FROM nginx:latest

# Copia o seu arquivo nginx.conf para o local correto
COPY nginx.conf /etc/nginx/nginx.conf

# Copia o diretório html para dentro do contêiner
COPY index/ /usr/share/nginx/html

# Cria os diretórios de log (se necessário)
RUN mkdir -p /var/log/nginx

# Define as permissões para os arquivos de log (se necessário)
RUN chmod 644 /var/log/nginx/*.log
