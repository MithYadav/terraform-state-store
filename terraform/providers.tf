terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.82"
    }
  }

  backend "s3" {
    bucket         = "custom-s3-terraform-state"
    key            = "infra/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "custom-terraform-state-dynamodb-lock"
  }
}

provider "aws" {
  region = var.aws_region
}
