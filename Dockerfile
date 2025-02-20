FROM nginx:latest

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/

# Cria o diretório de logs
RUN mkdir -p /var/log/nginx

# Define as permissões para o diretório de logs
RUN chmod 755 /var/log/nginx

EXPOSE 80
