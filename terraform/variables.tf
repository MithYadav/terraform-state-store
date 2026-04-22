variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "SpringBootApp"
}

# ─────────────────────────────────────────
# State backend variables
# Created by Bootstrap NOT Terraform
# ─────────────────────────────────────────
variable "state_bucket_name" {
  description = "S3 bucket for terraform state"
  type        = string
  default     = "custom-s3-terraform-state"
}

variable "lock_table_name" {
  description = "DynamoDB table for state lock"
  type        = string
  default     = "custom-terraform-state-dynamodb-lock"
}

# ─────────────────────────────────────────
# App resource variables
# Created by Terraform
# ─────────────────────────────────────────
variable "app_bucket_name" {
  description = "S3 bucket for application"
  type        = string
  default     = "springboot-app-bucket-prod"
}

variable "app_table_name" {
  description = "DynamoDB table for application"
  type        = string
  default     = "Products"
}
