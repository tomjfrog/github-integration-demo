# syntax=docker/dockerfile:1
FROM tomjfrog.jfrog.io/dockerhub-remote/node:18-slim

WORKDIR /usr/src/app

COPY package*.json ./

# npm auth via BuildKit secret only — not persisted in image layers
RUN --mount=type=secret,id=npmrc,target=/root/.npmrc \
    npm install

COPY . ./

EXPOSE 3000

CMD ["node", "index.js"]
