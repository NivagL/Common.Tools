# Infrastructure Scripts for Matoa

This folder contains infrastructure as code (IaC) scripts for deploying and managing the Matoa website environment.

## Current Implementation

The current implementation uses Azure Bicep scripts to provision and configure the necessary infrastructure on Microsoft Azure. Bicep is a domain-specific language (DSL) that simplifies the authoring of Azure Resource Manager (ARM) templates.

## Contents

- **Azure Bicep scripts**: Define the cloud resources required for the Matoa application
- **Deployment scripts**: Helper scripts for deploying the infrastructure
- **Configuration files**: Environment-specific configuration values

## Usage

To deploy the infrastructure:

1. Ensure you have the Azure CLI installed and authenticated
2. Navigate to this directory
3. Run the appropriate deployment script for your target environment

Example:
```bash
# Deploy to development environment
./deploy.sh dev

# Deploy to production environment
./deploy.sh prod
```

## Architecture

The infrastructure includes the following Azure resources:
- App Service for hosting the website
- SQL Database for storing application data
- Storage Accounts for file storage
- Application Insights for monitoring
- Key Vault for secrets management

## Notes

Before running any deployment, make sure to review the parameters and configuration values to ensure they match your desired setup.
