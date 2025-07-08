# Overview

This project builds upon Amazon's open-source Threat Composer Tool, which streamlines threat modeling and enhances security evaluations.

It has been enhanced to showcase a production-ready deployment on AWS, utilizing Docker, Terraform, ECS, and GitHub Actions. The setup includes automated infrastructure provisioning, a CI/CD pipeline, and secure HTTPS access through a Load Balancer.

## Architecture Diagram

(/img/AWS_arc.png)s

## Features

- Built on Amazon’s Threat Composer for effective threat modelling
- Lightweight, multi-stage Docker build for efficient containerisation
- Modular Terraform architecture for clean and scalable infrastructure as code
- ECS deployment within private subnets for enhanced security
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
