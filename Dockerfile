FROM node:22-bookworm-slim

WORKDIR /app

COPY package*.json ./
COPY Memory ./Memory
COPY Migrations ./Migrations
COPY AgentSourceCore ./AgentSourceCore
COPY App ./App
COPY scripts ./scripts
COPY tsconfig*.json ./

RUN npm ci
RUN npm run memory:build

ENV MEMMY_HOME=/data

VOLUME ["/data"]

EXPOSE 18960

CMD ["npm", "run", "memory:serve"]
