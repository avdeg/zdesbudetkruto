FROM n8nio/n8n:latest

USER root

# Устанавливаем ffmpeg + утилиты
RUN apk add --no-cache ffmpeg curl bash && \
    echo "✅ ffmpeg installed" && \
    ffmpeg -version

# Назначаем права для n8n
RUN chown -R node:node /home/node/.n8n

USER node
