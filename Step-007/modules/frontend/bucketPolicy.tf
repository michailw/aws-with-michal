resource "aws_s3_bucket_policy" "frontendBucketPolicy" {
  bucket = aws_s3_bucket.frontend_bucvket.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "CloudFront access policy",
  "Statement": [
    {
      "Sid": "CloudFront-Allow-Objects",
      "Effect": "Allow",
      "Principal": "*",
      "Action": ["s3:GetObject"],
      "Resource": "${aws_s3_bucket.frontend_bucvket.arn}/*"
    }
  ]
}
POLICY
}
