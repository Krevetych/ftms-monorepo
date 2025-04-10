FROM node:22-alpine

WORKDIR /app

RUN npm install -g pnpm

COPY . .

RUN pnpx prisma generate

RUN pnpm run build

EXPOSE 8080

RUN apk add --no-cache curl
RUN apk add --no-cache openssl

CMD ["pnpm", "start:prod"]