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
   - Initialize each Terraform Workspace:
   - terraform workspace new dev
   - terraform workspace new staging
   - terraform workspace new production
   - Switch Workspaces:
   - terraform workspace select dev
   - terraform workspace select staging
   - terraform workspace select production
   - On each work space Init, Plan and Apply:
   - Initialize Terraform: `terraform init`
   - Initialize Terraform: `terraform Plan`
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

![image](https://github.com/user-attachments/assets/1508722d-c67b-43e9-8780-d05971e43c44)

### Design Decisions
-  Security : Using a SystemAssigned identity for the App Service.
-  Scalability : The App Service Plan can be scaled up or out as needed.
-  Observability : Azure App Service provides built-in monitoring and logging features.
  
### Description of the files
variables.tf: Contains all the variables used in your Terraform configuration.
outputs.tf: Contains the output definitions.
provider.tf: Configures the Azure provider.
resource_group.tf: Manages the Azure resource group.
app_service.tf: Manages the Azure App Service Plan and App Service.
frontdoor.tf: Configures Azure Front Door.
application_gateway.tf: Sets up the Application Gateway with WAF.
key_vault.tf: Manages Azure Key Vault for secrets management.
monitoring.tf: Enables monitoring and logging with Azure Monitor and Application Insights.
network.tf: Configures the virtual network and subnet.
security.tf: Configures network security settings.
README.md: Documentation including instructions, high-level design, and future enhancements.

## Future Enhancements
-  CI/CD Pipeline : Implementing a CI/CD pipeline for automated deployments.
-  Scaling : Integrating with Azure Traffic Manager for global load balancing.
-  Security : Adding custom domain and SSL/TLS certificates.

## Extra Credit
- Implemented a CI/CD pipeline files name:
- workflows/ci-cd.yaml
