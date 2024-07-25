# Hello World Azure Web App

## Overview
This project deploys the "hello-world" Docker app to an Azure Web App using Terraform.

## Instructions

1.  Prerequisites 
   - Azure account
   - Docker Hub account
   - Terraform installed

2.  Setup 
   - Clone the repository.
   - Navigate to the project directory.

3.  Configuration 
   - Edit the `terraform.tfvars` file to include your Docker Hub credentials.
   - Set environment variables as next: export TF_VAR_db_username="your-username" export TF_VAR_db_password="your-password"


4.  Deployment 
   - Initialize Terraform: `terraform init`
   - Apply the configuration: `terraform apply`

## High-Level Design (HLD)
The solution leverages the following Azure services:
Resource Group: Contains all the Azure resources.
Virtual Network: Network isolation and security.
App Service: Host the Hello World application.
Front Door: Global load balancing and WAF.
Application Gateway: Additional WAF and load balancing.
Key Vault: Secure storage for secrets.
Monitoring: Azure Monitor and Application Insights.
Security: Network Security Groups and Application Security Groups.

### Design Decisions
-  Security : Using a SystemAssigned identity for the App Service.
-  Scalability : The App Service Plan can be scaled up or out as needed.
-  Observability : Azure App Service provides built-in monitoring and logging features.

## Future Enhancements
-  CI/CD Pipeline : Implementing a CI/CD pipeline for automated deployments.
-  Scaling : Integrating with Azure Traffic Manager for global load balancing.
-  Security : Adding custom domain and SSL/TLS certificates.

## Extra Credit
- Implement a CI/CD pipeline using Azure DevOps.
