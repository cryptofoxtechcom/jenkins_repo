# Use the official Nginx image as the base image
FROM nginx:latest

# Install dependencies and add Jenkins repository
RUN apt-get update && \
    apt-get install -y wget gnupg2 software-properties-common gettext-base && \
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | gpg --dearmor -o /usr/share/keyrings/jenkins-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list && \
    apt-get update && \
    apt-get install -y openjdk-11-jdk jenkins

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose ports for Nginx and Jenkins
EXPOSE 88 8080

# Create a volume for Jenkins data
VOLUME /var/lib/jenkins

# Start Nginx and Jenkins
CMD service nginx start && service jenkins start && tail -f /var/log/nginx/access.logFROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 88 8080

VOLUME /var/jenkins_home

CMD service nginx start && /usr/local/bin/jenkins.sh