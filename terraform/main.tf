# No resources here!
# S3 bucket and DynamoDB table are created
# by Bootstrap step in build.yml via AWS CLI
# Terraform just USES them to store state

locals {
  common_tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    CreatedBy   = "GitHub Actions"
  }
}
