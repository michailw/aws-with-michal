resource "aws_s3_bucket" "state_management_bucket" {
  bucket = var.state_management_bucket_name
  acl = "private"
}