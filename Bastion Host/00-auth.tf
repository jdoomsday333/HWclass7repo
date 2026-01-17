terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.18.0" #Make sure the terraform version works with code used
    }
  }
}

provider "aws" {
  # Configuration options

  region = "ap-southeast-7" #Choose region

  default_tags {
    tags = {
      ManagedBy = "Terraform"
    }
  }
}