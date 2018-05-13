FROM node:10

WORKDIR /docker-node

COPY docker-node/package.json /docker-node

RUN npm install

COPY docker-node /docker-node

CMD node index.js

EXPOSE 8090
