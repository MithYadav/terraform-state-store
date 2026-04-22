output "s3_bucket_name" {
  value       = aws_s3_bucket.terraform_state.id
  description = "S3 Bucket Name"
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.terraform_state.arn
  description = "S3 Bucket ARN"
}

output "s3_versioning_status" {
  value       = aws_s3_bucket_versioning.terraform_state.versioning_configuration[0].status
  description = "S3 Versioning Status"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_lock.name
  description = "DynamoDB Table Name"
}

output "dynamodb_table_arn" {
  value       = aws_dynamodb_table.terraform_lock.arn
  description = "DynamoDB Table ARN"
}

output "summary" {
  value = <<-EOT
    =========================================
    TERRAFORM BACKEND RESOURCES
    =========================================
    S3 Bucket  : ${aws_s3_bucket.terraform_state.id}
    S3 ARN     : ${aws_s3_bucket.terraform_state.arn}
    DynamoDB   : ${aws_dynamodb_table.terraform_lock.name}
    State File : s3://${aws_s3_bucket.terraform_state.id}/infra/terraform.tfstate
    =========================================
  EOT
}
