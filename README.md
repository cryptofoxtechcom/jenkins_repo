# Jenkins on Nginx with Docker 🐳

This project sets up Jenkins on an Nginx server using Docker. Nginx acts as a reverse proxy for Jenkins, making it accessible on port 80. A Docker volume is included for persistent storage of Jenkins data.

## Prerequisites 🛠️
- Docker installed on your machine.
- Basic knowledge of Docker and Jenkins.

## How to Use 🚀

1. **Clone the Repository**
   ```bash
   git clone https://github.com/cryptofoxtechcom/jenkins_repo.git
   cd jenkins-nginx-docker
   docker build -t jenkins-nginx .
   docker run -d -p 88:88 -p 8080:8080 --name jenkins-nginx-container -v jenkins-data:/var/lib/jenkins jenkins-nginx

```

Access Jenkins

Open your browser and go to http://localhost:88.

Jenkins will be accessible through the Nginx reverse proxy.

Get the Jenkins Initial Admin Password

bash
Copy
docker exec jenkins-nginx-container cat /var/jenkins_home/secrets/initialAdminPassword


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