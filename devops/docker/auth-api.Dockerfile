# Use the official Node.js image
FROM node:16

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY ./auth-api/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY ./auth-api .

# Expose the application's port
EXPOSE 3001

# Start the application
CMD ["npm", "run", "start:dev"]
