# Use an official nginx runtime as a parent image
FROM nginx:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install openssl and generate a self-signed SSL certificate
RUN apt-get update && apt-get install -y openssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Department/CN=localhost"

# Copy the nginx configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Expose ports 80 and 443
EXPOSE 80
EXPOSE 443

# Start nginx and keep the process from backgrounding and the container from exiting
CMD ["nginx", "-g", "daemon off;"]