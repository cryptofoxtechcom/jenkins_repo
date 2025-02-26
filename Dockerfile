# Use the official Nginx image as the base image
FROM nginx:latest

# Install Jenkins and other dependencies
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk wget && \
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add - && \
    sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' && \
    apt-get update && \
    apt-get install -y jenkins

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose ports for Nginx and Jenkins
EXPOSE 80 8080

# Start Nginx and Jenkins
CMD service nginx start && service jenkins start && tail -f /var/log/nginx/access.log