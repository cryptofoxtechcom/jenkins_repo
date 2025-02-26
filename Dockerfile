# Use the official Nginx image as the base image
FROM nginx:latest

# Install Jenkins and other dependencies
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk wget gnupg2 && \
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | gpg --dearmor -o /usr/share/keyrings/jenkins-keyring.gpg && \
    sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' && \
    apt-get update && \
    apt-get install -y jenkins

# Copy the Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose ports for Nginx and Jenkins
EXPOSE 80 8080

# Create a volume for Jenkins data
VOLUME /var/lib/jenkins

# Start Nginx and Jenkins
CMD service nginx start && service jenkins start && tail -f /var/log/nginx/access.log