# База: официальный образ n8n
FROM n8nio/n8n:latest
# или можно: FROM docker.n8n.io/n8nio/n8n:latest

# Временно даём root для установки пакетов
USER root

# Ставим ffmpeg и утилиты, чистим кэш apk
RUN apk update && \
    apk add --no-cache ffmpeg curl bash git && \
    rm -rf /var/cache/apk/*

# Права на домашнюю папку n8n (важно для кредов/файлов)
RUN chown -R node:node /home/node/.n8n

# Возвращаемся под пользователем n8n
USER node
