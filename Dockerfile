# Use the official Jenkins LTS image as the base image
FROM jenkins/jenkins:lts

# Install Nginx
USER root
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose ports for Nginx and Jenkins
EXPOSE 80 8080

# Create a volume for Jenkins data
VOLUME /var/jenkins_home

# Start Nginx and Jenkins
CMD service nginx start && /usr/local/bin/jenkins.sh