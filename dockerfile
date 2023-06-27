# Use an official nginx runtime as a parent image
FROM nginx:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Expose port 80
EXPOSE 80

# Start nginx and keep the process from backgrounding and the container from exiting
CMD ["nginx", "-g", "daemon off;"]