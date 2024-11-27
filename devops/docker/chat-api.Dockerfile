FROM node:16
WORKDIR /usr/src/app
COPY ./chat-api/package*.json ./
RUN npm install
COPY ./chat-api .
EXPOSE 3002
CMD ["npm", "run", "start:dev"]
