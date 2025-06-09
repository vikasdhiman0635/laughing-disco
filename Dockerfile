# Use Node.js to build Angular app
FROM node:24.1 AS builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build --prod

# Use Nginx for serving the built Angular app
FROM nginx:alpine
COPY --from=builder /app/dist/Learnnn/browser/ /usr/share/nginx/html/Learnnn/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

