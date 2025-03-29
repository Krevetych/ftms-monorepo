FROM node:22-alpine

WORKDIR /app

RUN npm install -g pnpm

COPY . .

RUN pnpm build

EXPOSE 4750

CMD ["pnpm", "start"]