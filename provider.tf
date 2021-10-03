
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.61.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-1"
}
