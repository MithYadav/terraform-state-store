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

variable "state_bucket_name" {
  description = "S3 bucket name for terraform state"
  type        = string
  default     = "custom-s3-terraform-state"
}

variable "lock_table_name" {
  description = "DynamoDB table name for state lock"
  type        = string
  default     = "custom-terraform-state-dynamodb-lock"
}
