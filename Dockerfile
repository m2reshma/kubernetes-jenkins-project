FROM debian:12-slim

# Install Apache2
RUN apt-get update && apt-get install -y apache2 && apt-get clean

# Set environment variable for the message
ENV MESSAGE="Hello from Debian! Running on port 8080."

# Create a simple HTML page with the message
RUN echo "<html><body><h1>${MESSAGE}</h1></body></html>" > /var/www/html/index.html

# Expose port 8080
EXPOSE 8080

# Change Apache default port from 80 to 8080
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf && \
    sed -i 's/:80/:8080/g' /etc/apache2/sites-enabled/000-default.conf

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]


