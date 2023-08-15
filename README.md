---

# Dynatrace AWS Monitoring Setup with Terraform

This project aims to automate the setup of Dynatrace monitoring for Amazon Web Services (AWS) resources using Terraform. It allows you to easily provision an Amazon EC2 instance as an ActiveGate for Dynatrace, and configure the necessary IAM roles and policies to enable monitoring of AWS services.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Configuration](#configuration)
- [Usage](#usage)
- [Variables](#variables)
- [Folder Structure](#folder-structure)
- [References](#references)

## Prerequisites

Before you begin, ensure you have the following prerequisites:

- AWS account with the necessary permissions
- Dynatrace account and API token
- Terraform installed on your local machine
- Familiarity with AWS services, IAM roles, and Dynatrace monitoring

## Getting Started

1. Clone this repository to your local machine.
2. Set up your AWS credentials using environment variables or AWS CLI.
3. Modify the `variables.tf` file to customize the configuration according to your needs.
4. Run `terraform init` to initialize the Terraform configuration.
5. Run `terraform plan` to review the changes that Terraform will apply.
6. Run `terraform apply` to deploy the Dynatrace monitoring setup in your AWS account.

## Configuration

This project consists of Terraform code to create the necessary AWS resources for Dynatrace monitoring, including an EC2 instance acting as an ActiveGate and associated IAM roles and policies.

- `main.tf`: Defines the resources to create, such as the EC2 instance and IAM roles.
- `variables.tf`: Contains the input variables that can be customized to suit your environment.
- `user_data.tftpl`: Template for the user data script used during EC2 instance creation.
- `ec2_assumerole_trust.json`: JSON policy document defining EC2 instance role trust relationship.
- `dynatrace_monitoring_policy.json`: JSON policy document defining permissions required for Dynatrace monitoring.
- `cross_account_role.tf`: Defines the cross-account assume role configuration.

## Usage

To deploy the Dynatrace monitoring setup, follow these steps:

1. Customize the `variables.tf` file with your specific configuration.
2. Run `terraform init` to initialize the project.
3. Run `terraform plan` to preview the changes that will be applied.
4. Run `terraform apply` to create the AWS resources and set up Dynatrace monitoring.
5. Monitor the Terraform output for any errors or issues.

## Variables

The `variables.tf` file contains variables that you can customize to tailor the deployment to your environment. Variables include AWS credentials, region, Dynatrace configuration, instance type, and more.

For a complete list of available variables and their descriptions, refer to the [Variables section](#variables) of this README.

## Folder Structure

The folder structure of this project is organized as follows:

```
.
├── main.tf
├── variables.tf
├── user_data.tftpl
├── ec2_assumerole_trust.json
├── dynatrace_monitoring_policy.json
├── cross_account_role.tf
├── provider.tf
├── terraform.tfvars
├── README.md
└── .gitignore
```

## References

For more information on Dynatrace, Terraform, and AWS services, refer to the following resources:

- [Dynatrace Documentation](https://www.dynatrace.com/support/help/)
- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [Amazon Web Services Documentation](https://docs.aws.amazon.com/index.html)

---
