# Jenkins on Nginx with Docker 🐳

This project sets up Jenkins on an Nginx server using Docker. Nginx acts as a reverse proxy for Jenkins, making it accessible on port 80.

## Prerequisites 🛠️
- Docker installed on your machine.
- Basic knowledge of Docker and Jenkins.

## How to Use 🚀

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-repo/jenkins-nginx-docker.git
   cd jenkins-nginx-docker
   docker build -t jenkins-nginx .
   docker run -d -p 80:80 -p 8080:8080 --name jenkins-nginx-container jenkins-nginx


Access Jenkins

Open your browser and go to http://localhost.

Jenkins will be accessible through the Nginx reverse proxy.

Get the Jenkins Initial Admin Password

bash
Copy
docker exec jenkins-nginx-container cat /var/lib/jenkins/secrets/initialAdminPassword
File Structure 📂
Copy
jenkins-nginx-docker/
├── Dockerfile
├── nginx.conf
├── README.md
└── .gitignore
License 📜
This project is licensed under the MIT License. See the LICENSE file for details.

cryptofoxtech.com