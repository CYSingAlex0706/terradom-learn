terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
    backend "s3" {
    bucket = "tf-backup-32311j123"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
    profile = "MyAWS"
  }
}

# Configure the AWS Provider
provider "aws" {
   region = "us-east-1"
   profile = "MyAWS"
  } 