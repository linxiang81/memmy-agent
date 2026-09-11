FROM node:22-bookworm-slim

WORKDIR /app

COPY . .

RUN npm ci
RUN npm run memory:build

ENV MEMMY_HOME=/data

VOLUME ["/data"]

EXPOSE 18960

CMD ["npm", "run", "memory:serve"]
