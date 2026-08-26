FROM nginx:alpine

COPY index.html /usr/share/nginx/html/iaslab/ingesoft5/despliegueprueba/index.html
COPY assets /usr/share/nginx/html/iaslab/ingesoft5/despliegueprueba/assets

EXPOSE 80
