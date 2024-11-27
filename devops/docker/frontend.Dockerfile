# Use Node.js for building the Angular app
FROM node:16 AS builder

# Set working directory and copy files
WORKDIR /usr/src/app
COPY ./frontend/package*.json ./
RUN npm install
COPY ./frontend .
RUN npm run build --prod

# Use Nginx to serve the built app
FROM nginx:alpine
COPY --from=builder /usr/src/app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
