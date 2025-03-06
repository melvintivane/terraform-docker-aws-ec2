<p align="center" width="100%">
    <img width="50%" src="https://github.com/melvintivane/terraform-docker-java-aws-ec2/blob/main/images/logoterraform.png"> 
</p>

# Terraform AWS EC2 + Docker Deployment

This repository contains a Terraform project that provisions an AWS EC2 instance, sets up Docker, and automatically
deploys a Spring Boot application in a container.

## 📌 Features

- **Security Group**: Allows HTTP (port 80) and SSH (port 22) access.
- **SSH Key**: Imports a local public SSH key for secure instance access.
- **EC2 Instance**:
    - Deploys an `t2.nano` EC2 instance with a predefined AMI.
    - Runs a startup script (`user_data.sh`) to install and configure Docker.
    - Pulls and runs a Docker container from Docker Hub.
- **Dockerfile**:
    - Uses `openjdk:21` as the base image.
    - Copies the Spring Boot JAR into the container.
    - Exposes port `8080`.
    - Defines the entry command to run the Java application.

## 🛠️ Prerequisites

- AWS account with proper permissions.
- Terraform installed (`>=1.0.0`).
- Public SSH key available at `~/.ssh/id_rsa.pub`.
- Spring Boot application packaged as a JAR (`target/app-0.0.1-SNAPSHOT.jar`).
- Docker image published on [Docker Hub](https://hub.docker.com/).

## 🚀 Quick Start

1. Clone the repository:
   ```sh
   git clone https://github.com/melvintivane/terraform-docker-aws-ec2.git
   cd terraform-docker-aws-ec2
   ```  
2. Initialize Terraform:
   ```sh
   terraform init
   ```  
3. Deploy the infrastructure:
   ```sh
   terraform apply -auto-approve
   ```  
4. Access the application:
    - Retrieve the public IP of the instance:
      ```sh
      terraform output
      ```  
    - Open in a browser:
      ```
      http://<PUBLIC_IP>
      ```  

## 🔥 Destroy Resources

To remove all created infrastructure:

```sh
terraform destroy -auto-approve
```  

**⚠️ Keep your AWS credentials secure and never share them publicly.** 🚀
