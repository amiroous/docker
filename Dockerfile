FROM nginx:latest

ENV HOST_PATH /webservice
ENV SERVER_PATH /usr/share/nginx/html

WORKDIR $SERVER_PATH

COPY $HOST_PATH/index.html index.html