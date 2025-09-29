FROM n8nio/n8n:latest

USER root
RUN apk update && apk add --no-cache ffmpeg curl bash

# проверим установку прямо в build log
RUN ffmpeg -version || echo "FFMPEG NOT INSTALLED"

USER node
