# tf-container-health

This repository contains Terraform configurations for creating and managing AWS resources, specifically for storing a vulnerable image in an Amazon ECR repository and setting up IAM roles and policies for Snyk integration.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Terraform Resources](#terraform-resources)
- [Variables](#variables)
- [Outputs](#outputs)
- [Pre-commit Hooks](#pre-commit-hooks)
- [License](#license)

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.2
- AWS account with appropriate permissions
- [pre-commit](https://pre-commit.com/) for running pre-commit hooks

## Usage

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/tf-container-health.git
    cd tf-container-health
    ```

2. Initialize Terraform:
    ```sh
    terraform init
    ```

3. Review the plan:
    ```sh
    terraform plan
    ```

4. Apply the configuration:
    ```sh
    terraform apply
    ```

## Terraform Resources

### ECR Repository

Defined in [ecr.tf](ecr.tf):
- `aws_ecr_repository.dotnet_app`: Creates an ECR repository named `dotnet-app-ecr-repo`.

### IAM Roles and Policies

Defined in [iam.tf](iam.tf):
- `aws_iam_policy.amazon_ec2_container_registry_read_only_for_snyk`: Policy allowing Snyk to access ECR resources with read-only permissions.
- `aws_iam_role.snyk_service_role`: IAM role for Snyk service.
- `aws_iam_role_policy_attachment.snyk_policy_attachment`: Attaches the read-only policy to the Snyk service role.

### Providers

Defined in [providers.tf](providers.tf):
- `aws`: Configures the AWS provider with the specified region.

## Variables

Defined in [variables.tf](variables.tf):
- `aws_region`: AWS region to use for all resources. Default is `eu-west-2`.

## Outputs

Defined in [output.tf](output.tf):
- `snyk_service_role_arn`: The ARN of the Snyk service role.

## Pre-commit Hooks

Pre-commit hooks are configured in [.pre-commit-config.yaml](.pre-commit-config.yaml) to ensure code quality and consistency. To set up pre-commit hooks, run:
```sh
pre-commit install
