FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 88 8080

VOLUME /var/jenkins_home

CMD service nginx start && /usr/local/bin/jenkins.sh