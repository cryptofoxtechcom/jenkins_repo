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
COPY nginx.conf /etc/nginx/nginx.conf.template

# Expose ports for Nginx and Jenkins
EXPOSE 88 8080

# Create a volume for Jenkins data
VOLUME /var/lib/jenkins

# Replace environment variables in the Nginx configuration file
CMD envsubst '${HOST_IP}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && \
    service nginx start && \
    service jenkins start && \
    tail -f /var/log/nginx/access.log