FROM node:22-bookworm-slim

WORKDIR /app

COPY . .

RUN npm ci

# Memory 的 tests/config.test.ts 依赖这个 workspace 的 dist 类型声明
RUN npm run build -w @memmy/local-api-contracts

RUN npm run memory:build

ENV NODE_ENV=production
ENV MEMMY_HOME=/data

EXPOSE 18960

CMD ["npm", "run", "memory:serve"]
