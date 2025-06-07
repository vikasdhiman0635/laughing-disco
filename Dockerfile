# Use Node.js to build Angular app
FROM node:22.12 AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build --prod

# Use Nginx for serving the built Angular app
FROM nginx:alpine
COPY --from=builder /app/dist/Learnnn /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

