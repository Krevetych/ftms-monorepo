FROM node:22-alpine

WORKDIR /app

COPY . .

RUN pnpm build

EXPOSE 4750

CMD ["pnpm", "start"]