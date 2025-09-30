FROM n8nio/n8n:latest

USER root

# Сбрасываем apk cache + ставим нужные пакеты
RUN rm -rf /var/cache/apk/* && \
    apk update && \
    apk add --no-cache ffmpeg curl bash git && \
    echo "✅ ffmpeg installed" && \
    ffmpeg -version

# Назначаем права для n8n
RUN chown -R node:node /home/node/.n8n

USER node
