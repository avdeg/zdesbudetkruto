FROM n8nio/n8n:latest

# n8n:latest у тебя сейчас на Alpine, поэтому используем apk
USER root
RUN apk add --no-cache ffmpeg curl bash

# Подхватываем порт от Railway, если он задан
RUN printf '%s\n' \
  '#!/usr/bin/env sh' \
  'set -e' \
  '[ -n "$PORT" ] && export N8N_PORT="$PORT"' \
  'echo "Using N8N_PORT=${N8N_PORT:-5678}"' \
  > /docker-entrypoint-init.d/10-set-port.sh \
  && chmod +x /docker-entrypoint-init.d/10-set-port.sh

USER node
