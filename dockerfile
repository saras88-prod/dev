# builder stage (build react app)
FROM node:18-bullseye-slim AS builder
WORKDIR /app

# install build deps if some native modules needed
RUN apt-get update && apt-get install -y build-essential python3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY package*.json ./
# use npm ci for deterministic installs; if peer deps issues, use npm install
RUN npm install

COPY . .
RUN npm run build

# production stage (serve with nginx)
FROM nginx:stable-alpine
# remove default conf if needed and copy our conf
COPY --from=builder /app/build /usr/share/nginx/html

# optional: provide single-page-app fallback
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]

