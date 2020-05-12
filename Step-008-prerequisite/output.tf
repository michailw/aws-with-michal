output "s3_bucket_name" {
  value = aws_s3_bucket.state_management_bucket.bucket
}

output "dynamodb_lock_table_name" {
  value = aws_dynamodb_table.dynamodb_terraform_lock.name
}
