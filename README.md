#  Automated Container Deployment & Cloud Administration

This project demonstrates **end-to-end DevOps automation** using Infrastructure as Code (IaC), Configuration Management, Containerisation, and CI/CD integration.

The deployment provisions cloud infrastructure on Amazon Web Services (AWS), configures a server using Ansible, deploys a Docker containerised web application, and automates deployment using GitHub Actions.

---

#  Project Architecture Overview

## Infrastructure Flow
GitHub → Terraform → AWS EC2 → Ansible → Docker → Web Application  

## CI/CD Flow
GitHub Push → GitHub Actions → Build Docker Image → SSH Deploy → Live Application  

---

#  Tools & Technologies Used

| Tool | Purpose |
|------|----------|
| Terraform | Infrastructure provisioning (IaC) |
| Ansible | Server configuration automation |
| Docker | Containerisation |
| GitHub Actions | CI/CD automation |
| AWS EC2 | Cloud hosting |

---

#  Repository Structure
Cloud Formation
│
├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── ansible/
│ └── install_docker.yml
├── app/
│ ├── Dockerfile
│ └── index.html
└── .github/
└── workflows/
└── deploy.yml
---

#  Prerequisites

Before running this project, ensure you have:

- AWS Account (Free Tier)
- AWS CLI configured
- Terraform installed
- Ansible installed
- Docker installed locally
- Git installed
- SSH key pair created

---

# Step 1 – Infrastructure Provisioning (Terraform)

Terraform provisions:

- EC2 Instance (Ubuntu Server)
- Security Group (Ports 22 & 80 open)
- SSH Key Pair
- Public IP Assignment

## Navigate to terraform folder

```bash
cd terraform
terraform init
terraform plan
terraform apply
```
After successful execution, Terraform outputs the public IP address of the EC2 instance.
---

# Step 2 Configuration Management (Ansible)

Ansible automates:

- System updates

- Docker installation

- Docker service start

- Docker enable on boot

  Navigate to the Ansible folder:
```cd ansible```

Run the playbook:
```ansible-playbook -i inventory.ini playbook.yml```

---

# Step 3 Docker Container

The web application is containerized using Docker.

The Dockerfile:

-Uses Ubuntu as the base image

-Installs Nginx engine

-Copies the web application files

-Runs the web server

Example Docker commands

Build Docker image:
```docker build -t custom-webapp .```
Run the container:
```docker run -d -p 80:80 custom-webapp```

---

# Step 4 CICD Pipeline 
Pipeline Workflow

On push to main branch:

- Checkout repository

- Build Docker image

- Connect to EC2 via SSH

- Stop old container

- Deploy updated container

workflow is located in:
- ```.github/workflows/deploy.yml```

 # Deployment

After the CI/CD pipeline runs successfully, the application is deployed automatically.

Access the application using the EC2 public IP address:
```http://<EC2_PUBLIC_IP>```

# Required GitHub Secrets

Add the following secrets in your repository:

- EC2_HOST → EC2 Public IP
- EC2_USER → ubuntu
- SSH_PRIVATE_KEY → Your private SSH key

  # Trigger CI/CD
  - Edit index.html
  - Commit changes:

  ```
  git add .
  git commit -m "Update web page"
  git push ```
- Navigate to GitHub → Actions tab

- Watch workflow execute

- Refresh your browser

  # Author

### Rohan Sasidharan

Cloud Formation Deployment Project

Terraform • Ansible • Dockers • GitHub Actions • AWS EC2
