FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Clean the default nginx html
RUN rm -rf ./*

# Copy your static site files (index.html, script.js)
COPY . .

EXPOSE 80
