# Use Node.js to build Angular app
FROM node:22 AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Use Nginx for serving the built Angular app
FROM nginx:1.25-alpine
COPY --from=builder /app/dist/Learnnn/ /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
