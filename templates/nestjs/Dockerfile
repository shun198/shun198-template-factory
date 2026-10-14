FROM node:26-alpine

WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN corepack enable && pnpm install

COPY . .

RUN pnpm run build

CMD ["node", "dist/main.js"]
