FROM node:20-slim
WORKDIR /app
ADD . .
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
