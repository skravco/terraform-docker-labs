# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Copy the website files into the container
COPY . /usr/share/nginx/html

# Expose port 80 to allow traffic to the web server
EXPOSE 80

# Run Nginx in the foreground (this is the default for the nginx image)
CMD ["nginx", "-g", "daemon off;"]

