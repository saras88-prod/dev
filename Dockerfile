FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
RUN npm install -g serve
EXPOSE 80
CMD ["serve", "-s", "build", "-l", "80"]


FROM node:18-bullseye-slim AS builder
WORKDIR /app


RUN apt-get update && apt-get install -y build-essential python3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY package*.json ./

RUN npm install

COPY . .
RUN npm run build

# production stage (serve with nginx)
FROM nginx:stable-alpine

COPY --from=builder /app/build /usr/share/nginx/html


COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
