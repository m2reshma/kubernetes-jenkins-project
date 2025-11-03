# Use Debian 12 as the base image
FROM debian:12

# Install Python (for serving simple web pages)
RUN apt-get update && apt-get install -y python3 && apt-get clean

# Set the working directory
WORKDIR /app

# Create a simple index.html file with your message
RUN echo "<h1>Hello from Docker running on port 80!</h1>" > index.html

# Expose port 80
EXPOSE 80

# Run a simple HTTP server on port 80
CMD ["python3", "-m", "http.server", "80"]


