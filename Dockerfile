# Use CentOS 7 as the base image
FROM centos:7

# Maintainer info
MAINTAINER reshma8466004811@gmail.com

# Install required packages
RUN yum install -y httpd unzip zip && \
    yum clean all

# Set working directory
WORKDIR /var/www/html

# Download the website template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

# Unzip and move files into html directory
RUN unzip photogenic.zip && \
    cp -r photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Expose HTTP port
EXPOSE 80 

# Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
