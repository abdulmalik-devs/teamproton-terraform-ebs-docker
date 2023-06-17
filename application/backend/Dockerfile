# Stage 1: Build the backend
FROM node:18

# Set the working directory for the backend
WORKDIR /app/server

# Copy the backend package.json and package-lock.json files
COPY package.json package-lock.json ./

# Install backend dependencies
RUN npm install

# Copy the backend source code
COPY . .

EXPOSE 5002

# Start the backend
CMD [ "node", "index.js" ]
