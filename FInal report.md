# Cloud Infrastructure Automation & CI/CD Deployment

##  Project Overview
This project demonstrates a fully automated DevOps lifecycle, including **Infrastructure as Code (IaC)**, **Configuration Management**, **Containerization**, and **CI/CD**. 

The goal is to provision a cloud server, configure it to run Docker, and deploy a custom Ubuntu-based web application automatically.

---

##  Architecture Diagram
The following diagram represents the flow of traffic from the user to the application hosted on AWS:



- **Cloud Provider:** AWS (Region: eu-west-1)
- **Networking:** Custom Security Group allowing Port 22 (SSH) and Port 80 (HTTP).
- **Compute:** EC2 Instance (t3.micro) running Ubuntu 22.04.
- **Containerization:** Docker Engine running a custom Ubuntu-based Nginx container.

---

##  Tools Used
| Tool | Purpose |
| :--- | :--- |
| **Terraform** | Infrastructure as Code (Provisioning AWS EC2 & Security Groups) |
| **Ansible** | Configuration Management (Installing Docker & System Setup) |
| **Docker** | Containerization (Ubuntu-based Web Application) |
| **GitHub Actions** | CI/CD Pipeline (Automated Build & Deployment) |
| **WSL / VS Code** | Development Environment |

---

##  Step-by-Step Automation Flow

### Part 1: Infrastructure Setup (Terraform)
The infrastructure is defined in `main.tf`. It automates the creation of:
- An **EC2 Instance** using a dynamic Ubuntu AMI.
- An **SSH Key Pair** for secure access.
- A **Security Group** to manage inbound and outbound traffic.
- **Command:** `terraform apply`

### Part 2: Configuration Management (Ansible)
Once the server is live, Ansible handles the environment setup:
- Updates system packages (`apt`).
- Installs **Docker.io**.
- Manages user permissions for the Docker group.
- **Command:** `ansible-playbook -i inventory.ini playbook.yml`

### Part 3: Container Deployment (Docker)
The application is containerized using a custom **Dockerfile**:
- **Base Image:** `ubuntu:22.04`
- **Software:** Nginx (Web Server).
- **Deployment:** The container runs on port 80 with a `--restart always` policy.

### Part 4: CI/CD Pipeline (GitHub Actions)
The integration is handled by GitHub Actions (`deploy.yml`):
- **Trigger:** Automatic deployment on every `git push` to the `main` branch.
- **Security:** Uses GitHub Secrets to store AWS Credentials and SSH Private Keys.

---

##  How to Run Locally
1. **Infrastructure:** Navigate to `/terraform` and run `terraform apply`.
2. **Configuration:** Copy the output IP to `/ansible/inventory.ini`.
3. **Deployment:** Navigate to `/ansible` and run `ansible-playbook -i inventory.ini playbook.yml`.
4. **Access:** Open `http://<EC2_PUBLIC_IP>` in your browser.

---

##  Deliverables Included
- [x] Terraform scripts (`main.tf`, `variables.tf`, `outputs.tf`)
- [x] Ansible playbooks and inventory files
- [x] Dockerfile and sample web application code
- [x] CI/CD Workflow configuration