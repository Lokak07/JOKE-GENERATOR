# ====== Stage 1: Build Stage ======
FROM node:lts-alpine3.21 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install --production

COPY . .

# ====== Stage 2: Production Stage ======
FROM node:lts-alpine3.21 AS production

WORKDIR /app

# Only copy the essential files from the build stage
COPY --from=build /app /app

EXPOSE 3000

CMD ["node", "index.js"]
