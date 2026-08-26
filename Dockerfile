FROM nginx:alpine

COPY index.html /usr/share/nginx/html/iaslab/ingesoftV/despliegueprueba/index.html
COPY assets /usr/share/nginx/html/iaslab/ingesoftV/despliegueprueba/assets

EXPOSE 80
