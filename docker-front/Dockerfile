FROM node:8.11.3-alpine

WORKDIR /app

RUN apk update && \
    rm -rf node_modules package-lock.json && \
    npm install && \
    npm install -g npm && \
    npm install -g @vue/cli
