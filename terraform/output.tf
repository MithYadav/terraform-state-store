output "app_bucket_name" {
  value       = aws_s3_bucket.app_bucket.id
  description = "App S3 Bucket Name"
}

output "app_bucket_arn" {
  value       = aws_s3_bucket.app_bucket.arn
  description = "App S3 Bucket ARN"
}

output "app_table_name" {
  value       = aws_dynamodb_table.app_table.name
  description = "App DynamoDB Table Name"
}

output "app_table_arn" {
  value       = aws_dynamodb_table.app_table.arn
  description = "App DynamoDB Table ARN"
}

output "summary" {
  value = <<-EOT
    =========================================
    APPLICATION RESOURCES
    =========================================
    App S3 Bucket  : ${aws_s3_bucket.app_bucket.id}
    App DynamoDB   : ${aws_dynamodb_table.app_table.name}
    -----------------------------------------
    STATE BACKEND (managed by Bootstrap)
    -----------------------------------------
    State S3 Bucket : custom-s3-terraform-state
    State DynamoDB  : custom-terraform-state-dynamodb-lock
    State File      : s3://custom-s3-terraform-state/infra/terraform.tfstate
    =========================================
  EOT
}
