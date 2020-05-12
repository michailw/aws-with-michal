resource "aws_s3_bucket" "s3_test_bucket" {
  bucket = "s3-test-bucket-terraform-plan"
  acl = "private"
}

resource "aws_s3_bucket" "s3_test_bucket_2" {
  bucket = "s3-test-bucket-terraform-plan-2"
  acl = "private"
}
