# Stage 1: Build stage
FROM node:18-alpine AS build-env

# Set working directory
WORKDIR /app

# Copy only package.json and package-lock.json first
COPY package*.json ./

# Install exact production dependencies using CI
RUN npm ci --only=production

# Copy your application code
COPY . .

# Stage 2: Final lightweight image
FROM gcr.io/distroless/nodejs20-debian12

WORKDIR /app

# Copy only necessary files (app code + node_modules)
COPY --from=build-env /app /app

EXPOSE 3000

# CMD expects entrypoint in distroless
CMD ["index.js"]
