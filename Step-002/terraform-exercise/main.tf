locals {
  s3_bucket_name = "my-tf-test-bucket-mwojtowicz"
  s3_origin_id = "origin-id-s3-bucket"
  cloud_front_price_class = "PriceClass_100"
  cloud_front_origin_access_identity_coment = "S3 Bucket Access Identity"
}

resource "aws_s3_bucket" "bucket_for_cloudfront" {
  bucket = local.s3_bucket_name
}

resource "aws_s3_bucket_policy" "bucket_for_cloudfront_policy" {
  bucket = aws_s3_bucket.bucket_for_cloudfront.id
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
      "Resource": "${aws_s3_bucket.bucket_for_cloudfront.arn}/*"
    }
  ]
}
POLICY

}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = local.cloud_front_origin_access_identity_coment
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.bucket_for_cloudfront.bucket_regional_domain_name
    origin_id   = local.s3_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  enabled = true
  is_ipv6_enabled = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = local.cloud_front_price_class

  restrictions {
    geo_restriction {
      restriction_type = "blacklist"
      locations        = ["RU"]
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
