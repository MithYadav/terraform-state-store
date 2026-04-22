output "summary" {
  value = <<-EOT
    =========================================
    TERRAFORM STATE BACKEND READY!
    =========================================
    State S3 Bucket : custom-s3-terraform-state
    State DynamoDB  : custom-terraform-state-dynamodb-lock
    State File      : s3://custom-s3-terraform-state/infra/terraform.tfstate
    Region          : us-east-1
    =========================================
  EOT
}
