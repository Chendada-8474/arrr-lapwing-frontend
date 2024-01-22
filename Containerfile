FROM node:10.1.0-alpine AS builder

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build

FROM builder

COPY /app/dist .

EXPOSE 5173

CMD ["http-server", "dist" , "-p 5173"]