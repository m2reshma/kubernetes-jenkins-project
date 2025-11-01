FROM debian:12

# Install Apache
RUN apt update && apt install -y apache2 && \
    apt clean && rm -rf /var/lib/apt/lists/*

# Create a simple default web page
RUN echo "<h1>Hello from Debian Apache Docker!</h1>" > /var/www/html/index.html

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]