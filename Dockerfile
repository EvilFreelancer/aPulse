FROM node:20-slim
WORKDIR /app
ADD . .
RUN ls -la
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
