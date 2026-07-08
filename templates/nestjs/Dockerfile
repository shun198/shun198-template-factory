FROM node:22-alpine

WORKDIR /app

COPY package.json ./
RUN corepack enable && pnpm install

COPY . .

RUN pnpm run build

CMD ["node", "dist/main.js"]
