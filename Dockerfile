FROM n8nio/n8n:latest

USER root
RUN apt-get update \
  && apt-get install -y --no-install-recommends ffmpeg curl \
  && rm -rf /var/lib/apt/lists/*

# Автоматически подставляем $PORT от Railway
RUN printf '%s\n' \
  '#!/usr/bin/env bash' \
  'set -e' \
  'if [ -n "$PORT" ]; then export N8N_PORT="$PORT"; fi' \
  'echo "Using N8N_PORT=${N8N_PORT:-5678}"' \
  > /docker-entrypoint-init.d/10-set-port.sh \
  && chmod +x /docker-entrypoint-init.d/10-set-port.sh

USER node
