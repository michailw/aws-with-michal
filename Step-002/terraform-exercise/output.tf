output "s3-bucket-arn" {
        value = aws_s3_bucket.bucket_for_cloudfront.arn
}

output "cf-domain" {
        value = aws_cloudfront_distribution.s3_distribution.domain_name
}
