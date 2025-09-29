FROM n8nio/n8n:latest-alpine

USER root
RUN apk add --no-cache ffmpeg curl

# Скрипт для Railway: если $PORT задан, подставляем в N8N_PORT
RUN printf '%s\n' \
  '#!/usr/bin/env sh' \
  'set -e' \
  '[ -n "$PORT" ] && export N8N_PORT="$PORT"' \
  'echo "Using N8N_PORT=${N8N_PORT:-5678}"' \
  > /docker-entrypoint-init.d/10-set-port.sh \
  && chmod +x /docker-entrypoint-init.d/10-set-port.sh

USER node
