FROM n8nio/n8n:latest
USER root
RUN apk add --no-cache ffmpeg curl bash
RUN chown -R node:node /home/node/.n8n
USER node
