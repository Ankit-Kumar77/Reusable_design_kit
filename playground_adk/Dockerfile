# Use lightweight nginx image
FROM nginx:alpine

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy built Flutter web app from Jenkins workspace
COPY playground_adk/build/web /usr/share/nginx/html

# Copy custom nginx configuration (if you have one)
COPY playground_adk/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
