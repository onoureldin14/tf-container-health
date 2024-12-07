terraform {
  backend "remote" {
    organization = "Onoureldin"
    workspaces {
      name = "tf-container-health"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.1.0"
    }
  }
  required_version = "~> 1.2"
}
