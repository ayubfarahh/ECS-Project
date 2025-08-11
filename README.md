# Overview

This project builds upon Amazon's open-source Threat Composer Tool, which streamlines threat modeling and enhances security evaluations.

It has been enhanced to showcase a production-ready deployment on AWS, utilizing Docker, Terraform, ECS, and GitHub Actions. The setup includes automated infrastructure provisioning, a CI/CD pipeline, and secure HTTPS access through a Load Balancer.

## Architecture Diagram

![alt text!](/img/AWS_arc.png)

## Features

- Built on Amazon’s Threat Composer for effective threat modelling
- Lightweight, multi-stage Docker build for efficient containerisation
- Modular Terraform architecture for clean and scalable infrastructure as code
- Public-facing HTTPS access via an Application Load Balancer and AWS Certificate Manager
- Integrated security scanning using Trivy during the Docker image build process
- Clearly separated CI/CD workflows for plan, apply, and destroy stages
- Custom domain access configured via DNS settings

## Directory Structure

```css
/
├── .github/
│   └── workflows/
│       ├── build.yaml
│       ├── tf-apply.yaml
│       ├── tf-destroy.yml
│       └── tf-plan.yml
├── app/
├── img/
├── terraform/
│   ├── .terraform/
│   ├── modules/
│   │   ├── alb/
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   ├── iam/
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   ├── ecs/
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   ├── route53/
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   └── vpc/
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   ├── .terraform.lock.hcl
│   ├── main.tf
│   ├── outputs.tf
│   ├── providers.tf
│   ├── terraform.tfvars
│   └── variables.tf
|   └── backend.tf
├── .gitignore
└── README.md
```
## Local App Setup 💻

```
yarn install
yarn build
yarn global add serve
serve -s build

```

Then visit: [http://localhost:3000](http://localhost:3000/)

## Deployment Workflow

1. Terraform Plan

- Executes terraform init and terraform plan
- Validates the configuration with TFLint
- Conducts a security analysis using Checkov

2. Terraform Apply

- Applies the Terraform configuration to provision or update AWS resources
- Includes setup of the ALB, Route 53 DNS records, and ACM certificate

3. Docker Build and Push

- Builds the Docker image
- Performs a security scan using Trivy
- Pushes the image to Amazon ECR
- Deploys latest image to ECS

4. Terraform Destroy

- Destroys all infrastructure managed by Terraform when no longer required

## Final Result + Github Action Workflows ✅

### Live Page

![alt text!](/img/website1.png)

### Docker Build + Deploy

![alt text!](/img/build-deploy.png)

### Terraform Plan

![alt text!](/img/tf-plan.png)

### Terraform Apply

![alt text!](/img/tf-apply.png)

### Terraform Destroy

![alt text!](/img/tf-destroy.png)
