# Stage 1: Build the frontend
FROM node:18 AS build

# Set the working directory for the frontend
WORKDIR /app/admin

# Copy the frontend package.json and package-lock.json files
COPY package.json package-lock.json ./

# Install frontend dependencies
RUN npm install

# Copy the frontend source code
COPY . .

# Build the frontend app
RUN npm run build

# Stage 2: Serve the frontend with a lightweight HTTP server
FROM node:18 AS production

# Set the working directory for the production image
WORKDIR /app/admiin

# Copy the build artifacts from the build stage
COPY --from=build /app/admin/build ./build

# Install a lightweight HTTP server
RUN npm install -g serve

# Expose port 3000
EXPOSE 3001

# Start the HTTP server to serve the built frontend
CMD ["serve", "-s", "build", "-l", "3001"]

