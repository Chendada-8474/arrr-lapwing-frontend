FROM node:20.8.0-alpine AS builder

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build

FROM node:20.8.0-slim

RUN npm install -g http-server

COPY --from=builder /app/dist /dist

EXPOSE 5173

CMD [ "http-server", "dist", "-p 5173" ]