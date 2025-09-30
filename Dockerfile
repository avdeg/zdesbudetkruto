FROM n8nio/n8n:latest

USER root

# Устанавливаем ffmpeg + полезные утилиты
RUN apk update && apk add --no-cache ffmpeg curl bash git && \
    echo "✅ ffmpeg installed" && \
    ffmpeg -version

# Назначаем права для n8n
RUN chown -R node:node /home/node/.n8n

USER node
